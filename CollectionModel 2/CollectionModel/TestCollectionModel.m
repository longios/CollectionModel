//
//  TestCollectionModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "TestCollectionModel.h"

@implementation TestCollectionModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellclass = [TestCollectionCell class];
    }
    return self;
}

@end

@interface TestCollectionCell ()
@property (strong, nonatomic) UIImageView *imgview;
@end

@implementation TestCollectionCell
DEF_SINGLETON(TestCollectionModel)

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupview];
    }
    return self;
}

- (void)setupview {
    self.imgview = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80, 40)];
    [self.contentView addSubview:self.imgview];
}

- (void)setCellModel:(TestCollectionModel *)cellModel {
    _cellModel = cellModel;
    self.imgview.image = cellModel.image;
}

+ (CGSize)cellSizeWithCollectionView:(UICollectionView *)collectionview model:(__kindof ZLCollectionCellModel *)model {
    CGSize size = [self dynamicSizeWithCollectionView:collectionview cellModel:model shareCell:[TestCollectionCell sharedInstance] sizeblock:^CGSize(UICollectionView *collectionview, __kindof ZLCollectionCellModel *cellModel, UICollectionViewCell<ZLCollectionViewCellProtocol> *cell) {
        return CGSizeMake(90, 50);
    }];
    return size;

}
@end
