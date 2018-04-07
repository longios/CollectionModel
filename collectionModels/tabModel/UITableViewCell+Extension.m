//
//  UITableViewCell+Extension.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "UITableViewCell+Extension.h"
#import "ZLTableviewCellModel.h"


@implementation UITableViewCell (Extension)

+ (CGFloat)dynamicHeightWithTableview:(UITableView *)tableview cellmodel:(__kindof ZLTableviewCellModel*)model sharedCell:(__kindof UITableViewCell<ZLTableViewCellModelProtocol> *)cell heightBlock:(HeightBlock)heightblock {
    cell.cellModel = model;
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGFloat height = 44;
    if(heightblock) {
        height = heightblock(tableview, model, cell);
    }
    return height;
}

//+ (CGFloat)cellHeightWithTableview:(UITableView *)tableview model:(__kindof ZLTableviewCellModel *)model {
//    return 44;
//}

@end
