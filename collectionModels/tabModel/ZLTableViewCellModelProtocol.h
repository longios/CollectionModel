//
//  ZLTableViewCellModelProtocol.h
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITableViewCell+Extension.h"
@class ZLTableviewCellModel;

@protocol ZLTableViewCellModelProtocol <NSObject>
@property (strong, nonatomic) __kindof ZLTableviewCellModel *cellModel;
+ (CGFloat)cellHeightWithTableview:(UITableView *)tableview model:(__kindof ZLTableviewCellModel *)model;

@end
