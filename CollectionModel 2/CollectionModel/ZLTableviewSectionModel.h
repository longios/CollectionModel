//
//  ZLTableviewSectionModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLSectionModel.h"
#import "ZLTableviewCellModel.h"
#import "ZLTableViewSectionViewProtocol.h"
#import "UIView+TabSectionViewExtension.h"
@class ZLTabViewModel;

@interface ZLTableviewSectionModel : ZLSectionModel
//@property (strong, nonatomic) NSMutableArray<__kindof ZLTableviewCellModel *> *cellModels;
@property (weak, nonatomic) ZLTabViewModel *trueViewModel;
@property (strong, nonatomic) Class<ZLTableViewSectionViewProtocol> headClass;
@property (strong, nonatomic) Class<ZLTableViewSectionViewProtocol> footClass;


@end
