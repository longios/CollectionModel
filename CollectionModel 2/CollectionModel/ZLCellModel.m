//
//  ZLCellModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCellModel.h"
#import "ZLListViewModel.h"
#import "ZLSectionModel.h"

@implementation ZLCellModel
- (void)resetIndexPath {
    // 需要重新取计算
    _indexpath = nil;
}

- (NSIndexPath *)indexpath {
    if(!_indexpath) {
        NSUInteger index = [self.sectionModel.cellModels indexOfObject:self];
        _indexpath = [NSIndexPath indexPathForRow:index inSection:self.sectionModel.section];
    }
    return _indexpath;
}

@end
