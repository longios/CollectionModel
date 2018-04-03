//
//  ZLCollectionViewCellProtocol.h
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ZLCollectionCellModel.h"
@class ZLCollectionCellModel;

@protocol ZLCollectionViewCellProtocol <NSObject>
@property (strong, nonatomic) __kindof ZLCollectionCellModel *cellModel;
+ (CGSize)cellSizeWithCollectionView:(UICollectionView *)collectionview  model:(__kindof ZLCollectionCellModel *)model;

@end
