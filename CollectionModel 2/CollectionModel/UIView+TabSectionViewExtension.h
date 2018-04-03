//
//  UIView+TabSectionViewExtension.h
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLTableViewSectionViewProtocol.h"
@class ZLTableviewSectionModel;

typedef CGFloat (^CallBackHeightBlock)( UITableView *tableview, __kindof ZLTableviewSectionModel *model, __kindof UIView *view);
@interface UIView (TabSectionViewExtension)
+ (CGFloat)dynamicHeightWithTableview:(UITableView *)tableview
                              section:(__kindof ZLTableviewSectionModel *)sectionmodel
                           sharedView:(__kindof UIView<ZLTableViewSectionViewProtocol> *)view heightblock:(CallBackHeightBlock)heightblock;

@end
