//
//  ZLCollectionViewModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCollectionViewModel.h"
#import "ZLCollectionViewCellProtocol.h"
#import "ZLCollectionViewReuseViewProtocol.h"

@interface ZLCollectionViewModel ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
// 记录已经注册的cell
@property (strong, nonatomic) NSMutableDictionary *registerDic;
@property (strong, nonatomic) NSMutableDictionary *registerHeadDic;
@property (strong, nonatomic) NSMutableDictionary *registerFootDic;
@end

@implementation ZLCollectionViewModel
// 采用flowLayout布局的时候 size 的计算什么才有用。
- (instancetype)initWithCollectionView:(UICollectionView *)collectionview {
    if(self = [super init]) {
        self.collectionview = collectionview;
    }
    return self;
}
- (void)setCollectionview:(UICollectionView *)collectionview {
    _collectionview = collectionview;
    _collectionview.delegate = self;
    _collectionview.dataSource = self;
}
- (void)reloadTabData {
    [self.collectionview reloadData];
}
- (void)reloadSectionAtIndex:(NSUInteger)index {
    NSIndexSet *indexset = [NSIndexSet indexSetWithIndex:index];
    [self.collectionview reloadSections:indexset];
}
#pragma mark "private"
- (ZLCollectionCellModel *)cellModelAtIndexPath:(NSIndexPath *)indexpath {
    ZLCollectionSectionModel *section = [self.sectionModels objectAtIndex:indexpath.section];
    ZLCollectionCellModel *model = [section cellModelAtIndex:indexpath.row];
    return model;
}

#pragma mark "runtime"
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if([self.forwardDelegate respondsToSelector:aSelector]) {
        return self.forwardDelegate;
    }else if([self.forwardDatasource respondsToSelector:aSelector]) {
        return self.forwardDatasource;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if([super respondsToSelector:aSelector]) {
        return YES;
    }
    if([self.forwardDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    if([self.forwardDatasource respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

#pragma mark "setget"

- (void)setForwardDelegate:(id<UICollectionViewDelegate>)forwardDelegate {
    _forwardDelegate = forwardDelegate;
    if(self.collectionview.delegate == self) {
        self.collectionview.delegate = nil;
        self.collectionview.delegate = self;
    }
}

- (NSMutableDictionary *)registerDic {
    if(!_registerDic) {
        _registerDic = [NSMutableDictionary dictionary];
    }
    return _registerDic;
}

- (NSMutableDictionary *)registerFootDic {
    if(!_registerFootDic) {
        _registerFootDic = [NSMutableDictionary dictionary];
    }
    return _registerFootDic;
}

- (NSMutableDictionary *)registerHeadDic {
    if(!_registerHeadDic) {
        _registerHeadDic = [NSMutableDictionary dictionary];
    }
    return _registerHeadDic;
}

- (ZLCollectionSectionModel *)lastsection {
    if(self.sectionModels.count == 0) {
        // 创建一个section
        ZLCollectionSectionModel *section = [[ZLCollectionSectionModel alloc] init];
        [self addSectionModel:section];
    }
    return [self.sectionModels lastObject];
}

#pragma mark "UICollectionViewDatasource"
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    ZLCollectionSectionModel *sectionmodel = self.sectionModels[section];
    return sectionmodel.cellModels.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLCollectionCellModel *cellmodel = [self cellModelAtIndexPath:indexPath];
    if(![self.registerDic objectForKey:cellmodel.identity]) {
         [collectionView registerClass:cellmodel.cellclass forCellWithReuseIdentifier:cellmodel.identity];
        [self.registerDic setObject:@(1) forKey:cellmodel.identity];
    }
    UICollectionViewCell<ZLCollectionViewCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellmodel.identity forIndexPath:cellmodel.indexpath];
    cell.cellModel = cellmodel;
    cellmodel.cell = cell;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionModels.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    ZLCollectionSectionModel *sectionmodel = self.sectionModels[indexPath.section];
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if(![self.registerHeadDic objectForKey:sectionmodel.identify]) {
            [collectionView registerClass:sectionmodel.headclass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionmodel.identify];
            [self.registerHeadDic setObject:@(1) forKey:sectionmodel.identify];
        }
        UICollectionReusableView<ZLCollectionViewReuseViewProtocol> *reuseview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionmodel.identify forIndexPath:indexPath];
        reuseview.sectionModel = sectionmodel;
        return reuseview;
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        if(![self.registerFootDic objectForKey:sectionmodel.identify]) {
            [collectionView registerClass:sectionmodel.footclass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:sectionmodel.identify];
            [self.registerFootDic setObject:@(1) forKey:sectionmodel.identify];
        }
        UICollectionReusableView<ZLCollectionViewReuseViewProtocol> *reuseview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:sectionmodel.identify forIndexPath:indexPath];
        reuseview.sectionModel = sectionmodel;
        return reuseview;
    }
    return nil;
}

#pragma mark "UICollectionViewDelegate"
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLCollectionCellModel *cellmodel = [self cellModelAtIndexPath:indexPath];
    if(cellmodel.whenClick) {
        cellmodel.whenClick(cellmodel);
    }
}
#pragma mark "UICollectionViewDelegateFlowLayout"
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
     ZLCollectionCellModel *cellmodel = [self cellModelAtIndexPath:indexPath];
    Class<ZLCollectionViewCellProtocol> cls = cellmodel.cellclass;
    if(!CGSizeEqualToSize(cellmodel.cellsize, CGSizeZero) ) {
        return cellmodel.cellsize;
    }
    CGSize size = [cls cellSizeWithCollectionView:collectionView model:cellmodel];
    cellmodel.cellsize = size;
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    ZLCollectionSectionModel *sectionmodel = self.sectionModels[section];
    if(sectionmodel.headclass) {
        Class<ZLCollectionViewReuseViewProtocol> cls = sectionmodel.headclass;
        return [cls viewSizeWithCollectionView:collectionView model: sectionmodel];
    }
    return CGSizeZero;

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    ZLCollectionSectionModel *sectionmodel = self.sectionModels[section];
    if(sectionmodel.footclass) {
        Class<ZLCollectionViewReuseViewProtocol> cls = sectionmodel.footclass;
        return [cls viewSizeWithCollectionView:collectionView model: sectionmodel];
    }
    return CGSizeZero;

}

@end
