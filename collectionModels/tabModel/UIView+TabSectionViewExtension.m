//
//  UIView+TabSectionViewExtension.m
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "UIView+TabSectionViewExtension.h"
#import "ZLTableviewSectionModel.h"

@implementation UIView (TabSectionViewExtension)
+ (CGFloat)dynamicHeightWithTableview:(UITableView *)tableview
                              section:(__kindof ZLTableviewSectionModel *)sectionmodel
                           sharedView:(__kindof UIView<ZLTableViewSectionViewProtocol> *)view heightblock:(CallBackHeightBlock)heightblock {
    view.sectionModel = sectionmodel;
    [view setNeedsLayout];
    [view layoutIfNeeded];
    CGFloat height = 44;
    if(heightblock) {
        height = heightblock(tableview, sectionmodel,view);
    }
    return height;
}

@end
