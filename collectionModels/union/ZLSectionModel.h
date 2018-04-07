//
//  ZLSectionModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLCellModel.h"
@class ZLListViewModel;

@interface ZLSectionModel : NSObject
@property (weak, nonatomic) __kindof ZLListViewModel *viewmodel;
@property (strong, nonatomic) NSMutableArray *cellModels;
@property (assign, nonatomic) NSUInteger section;

- (void)addCellModel:(__kindof ZLCellModel *)cellmodel;
- (void)addCellModels:(NSArray<__kindof ZLCellModel *>*)cellmodels;
- (void)insertCellModel:(__kindof ZLCellModel *)cellModel atIndex:(NSUInteger)index;
- (void)insertCellModels:(NSArray<__kindof ZLCellModel *> *)cellmodels atIndex:(NSUInteger)index;
- (void)deleteCellModel:(__kindof ZLCellModel *)cellmodel;
- (void)deleteCellModelAtIndex:(NSUInteger)index;
- (void)removeAllCellModels;
- (__kindof ZLCellModel *)cellModelAtIndex:(NSUInteger)index;
- (void)resetsection;
- (void)refresh;
@end
