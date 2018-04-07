//
//  ZLCollectionViewModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLListViewModel.h"
#import "ZLCollectionSectionModel.h"
#import "ZLCollectionCellModel.h"

@interface ZLCollectionViewModel : ZLListViewModel
@property (weak, nonatomic) UICollectionView *collectionview;
@property (weak, nonatomic) id<UICollectionViewDelegate> forwardDelegate;
@property (weak, nonatomic) id<UICollectionViewDataSource> forwardDatasource;
- (instancetype)initWithCollectionView:(UICollectionView *)collectionview;
- (void)reloadTabData;
- (void)reloadSectionAtIndex:(NSUInteger)index;
@end
