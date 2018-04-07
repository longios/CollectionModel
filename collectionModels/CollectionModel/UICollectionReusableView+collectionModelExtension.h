//
//  UICollectionReusableView+collectionModelExtension.h
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLCollectionViewReuseViewProtocol.h"
@class ZLCollectionSectionModel;

typedef CGSize (^SizeBlock)( UICollectionView *collectionview, ZLCollectionSectionModel *sectionmodel, UICollectionReusableView *shareview);
@interface UICollectionReusableView (collectionModelExtension)
+ (CGSize)dynamicsizeWithCollectionview:(UICollectionView *)collectionview sectionmodel:(__kindof ZLCollectionSectionModel *)sectionmodel shareview:(UICollectionReusableView<ZLCollectionViewReuseViewProtocol> *)shareview sizeblock:(SizeBlock)sizeblock;



@end
