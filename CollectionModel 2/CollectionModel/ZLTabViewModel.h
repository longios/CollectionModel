//
//  ZLTabViewModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLListViewModel.h"
#import "ZLTableviewSectionModel.h"
#import "ZLTableviewCellModel.h"
#import <objc/runtime.h>
#import "UITableViewCell+Extension.h"

@interface ZLTabViewModel : ZLListViewModel
// 没必要持有
@property (weak, nonatomic) UITableView *tableview;
// 通过消息转发时候拦截  有可能给外面实现  
@property (weak, nonatomic) id<UITableViewDelegate> forwardDelegate;
@property (weak, nonatomic) id<UITableViewDataSource> forwardDatasource;

- (instancetype)initWithTableview:(UITableView *)tableview;
- (void)reloadTabData;
- (void)reloadSectionAtIndex:(NSUInteger)index;


@end
