//
//  ZLCollectionViewReuseViewProtocol.h
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLCollectionSectionModel;

@protocol ZLCollectionViewReuseViewProtocol <NSObject>
@property (strong, nonatomic) __kindof ZLCollectionSectionModel *sectionModel;
+ (CGSize)viewSizeWithCollectionView:(UICollectionView *)collectionview model:(__kindof ZLCollectionSectionModel *)sectionModel;

@end
