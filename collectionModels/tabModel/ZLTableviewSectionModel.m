//
//  ZLTableviewSectionModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLTableviewSectionModel.h"
#import "ZLTabViewModel.h"

@interface ZLTableviewSectionModel ()
@end

@implementation ZLTableviewSectionModel

#pragma mark "OpenMethod"

- (void)refresh {
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:self.section];
    for(ZLTableviewCellModel *model in self.cellModels) {
        model.cellheight = 0;
    }
    [self.trueViewModel.tableview reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark "Lazy"
- (void)setViewmodel:(__kindof ZLListViewModel *)viewmodel {
    [super setViewmodel:viewmodel];
    self.trueViewModel = (ZLTabViewModel *)viewmodel;
}

@end
