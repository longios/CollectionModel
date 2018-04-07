//
//  ZLCollectionCellModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCellModel.h"
#import "ZLCollectionViewCellProtocol.h"
#import "UICollectionViewCell+CollectionModelExtension.h"
@class ZLCollectionCellModel;
@class ZLCollectionSectionModel;
@class ZLCollectionViewModel;
typedef void (^CollectionCellClick)( __kindof ZLCollectionCellModel *cellModel);

@interface ZLCollectionCellModel : ZLCellModel
@property (weak, nonatomic) ZLCollectionSectionModel *truesectionModel;
@property (weak, nonatomic) ZLCollectionViewModel *trueviewModel;
@property (weak, nonatomic) UICollectionViewCell *cell;
@property (strong, nonatomic) NSString *identity;
@property (copy, nonatomic) CollectionCellClick whenClick;
@property (strong, nonatomic) Class<ZLCollectionViewCellProtocol> cellclass;
// 缓存size
@property (assign, nonatomic) CGSize cellsize;

- (void)refresh;

@end
