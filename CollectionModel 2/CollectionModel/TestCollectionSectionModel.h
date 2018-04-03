//
//  TestCollectionSectionModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCollectionSectionModel.h"

@interface TestCollectionSectionModel : ZLCollectionSectionModel
@property (strong, nonatomic) NSString *headstr;

@end

@interface TestCollectionSectionView : UICollectionReusableView <ZLCollectionViewReuseViewProtocol>
@property (strong, nonatomic) TestCollectionSectionModel *sectionModel;
@end
