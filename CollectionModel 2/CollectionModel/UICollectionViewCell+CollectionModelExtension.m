//
//  UICollectionViewCell+CollectionModelExtension.m
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "UICollectionViewCell+CollectionModelExtension.h"

@implementation UICollectionViewCell (CollectionModelExtension)
+ (CGSize)dynamicSizeWithCollectionView:(UICollectionView *)collectionview cellModel:(__kindof ZLCollectionCellModel *)cellmodel shareCell:(__kindof UICollectionViewCell<ZLCollectionViewCellProtocol> *)cell sizeblock:(CellSizeBlock)sizeblock {
    cell.cellModel = cellmodel;
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGSize size = CGSizeMake(collectionview.frame.size.width, 44);
    if(sizeblock) {
        size = sizeblock(collectionview, cellmodel, cell);
    }
    return size;
}

@end
