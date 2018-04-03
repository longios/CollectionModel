//
//  UICollectionViewCell+CollectionModelExtension.h
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLCollectionViewCellProtocol.h"
@class ZLCollectionCellModel;

typedef CGSize (^CellSizeBlock)( UICollectionView *collectionview, __kindof ZLCollectionCellModel *cellModel , UICollectionViewCell<ZLCollectionViewCellProtocol> *cell);
@interface UICollectionViewCell (CollectionModelExtension)
+ (CGSize)dynamicSizeWithCollectionView:(UICollectionView *)collectionview cellModel:(__kindof ZLCollectionCellModel *)cellmodel shareCell:(__kindof UICollectionViewCell<ZLCollectionViewCellProtocol> *)cell sizeblock:(CellSizeBlock)sizeblock;
@end
