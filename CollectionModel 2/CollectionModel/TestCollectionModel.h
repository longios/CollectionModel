//
//  TestCollectionModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCollectionCellModel.h"
#import "UICollectionViewCell+CollectionModelExtension.h"

@interface TestCollectionModel : ZLCollectionCellModel
@property (strong, nonatomic) UIImage *image;
@end

@interface TestCollectionCell : UICollectionViewCell <ZLCollectionViewCellProtocol>
@property (strong, nonatomic) TestCollectionModel *cellModel;
@end
