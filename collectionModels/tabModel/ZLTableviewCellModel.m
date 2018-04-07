//
//  ZLTableviewCellModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLTableviewCellModel.h"
#import "ZLTabViewModel.h"
#import "ZLTableviewSectionModel.h"

@implementation ZLTableviewCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellstyle = UITableViewCellStyleDefault;
    }
    return self;
}

- (void)refresh {
    _cellheight = 0;
    [self.trueviewModel.tableview reloadRowsAtIndexPaths:[NSArray arrayWithObjects:self.indexpath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark "setget"
- (NSString *)identity {
    return NSStringFromClass([self class]);
}

- (void)setViewmodel:(ZLListViewModel *)viewmodel {
    [super setViewmodel:viewmodel];
    self.trueviewModel = (ZLTabViewModel *)viewmodel;
}

- (void)setSectionModel:(ZLSectionModel *)sectionModel {
    [super setSectionModel:sectionModel];
    self.truesectionModel = (ZLTableviewSectionModel *)sectionModel;
}

@end
