//
//  UITableViewCell+Extension.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLTableviewCellModel;

typedef CGFloat (^HeightBlock)( UITableView *tableview, __kindof ZLTableviewCellModel *cellmodel , UITableViewCell *cell);


// cell 持有model  cell被tableview持有   model 持有weak cell
@interface UITableViewCell (Extension) 
//提供单例 动态计算
+ (CGFloat)dynamicHeightWithTableview:(UITableView *)tableview cellmodel:(__kindof ZLTableviewCellModel*)model sharedCell:(__kindof UITableViewCell *)cell heightBlock:(HeightBlock)heightblock;




@end
