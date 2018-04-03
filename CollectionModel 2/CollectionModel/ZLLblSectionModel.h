//
//  ZLLblSectionModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLTableviewSectionModel.h"

@interface ZLLblSectionModel : ZLTableviewSectionModel
@property (strong, nonatomic) NSString *headstr;
//@property (strong, nonatomic) NSString *footstr;
@end

@interface ZlSectionLblView : UIView<ZLTableViewSectionViewProtocol>
@property (strong, nonatomic) ZLLblSectionModel *sectionModel;
@end
