//
//  ZLCollectionSectionModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLSectionModel.h"
#import "ZLCollectionViewReuseViewProtocol.h"
#import "UICollectionReusableView+collectionModelExtension.h"
@class ZLCollectionViewModel;

@interface ZLCollectionSectionModel : ZLSectionModel
@property (weak, nonatomic) ZLCollectionViewModel *trueviewmodel;
@property (strong, nonatomic) Class<ZLCollectionViewReuseViewProtocol> headclass;
@property (strong, nonatomic) Class<ZLCollectionViewReuseViewProtocol> footclass;
@property (strong, nonatomic) NSString *identify;

@end
