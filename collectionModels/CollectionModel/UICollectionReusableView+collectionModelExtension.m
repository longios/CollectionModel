//
//  UICollectionReusableView+collectionModelExtension.m
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "UICollectionReusableView+collectionModelExtension.h"

@implementation UICollectionReusableView (collectionModelExtension)
+ (CGSize)dynamicsizeWithCollectionview:(UICollectionView *)collectionview sectionmodel:(__kindof ZLCollectionSectionModel *)sectionmodel shareview:(UICollectionReusableView<ZLCollectionViewReuseViewProtocol> *)shareview sizeblock:(SizeBlock)sizeblock {
    shareview.sectionModel = sectionmodel;
    [shareview setNeedsLayout];
    [shareview layoutIfNeeded];
    CGSize size = CGSizeMake(collectionview.frame.size.width, 44);
    if(sizeblock) {
        size = sizeblock(collectionview, sectionmodel, shareview);
    }
    return size;
}


@end
