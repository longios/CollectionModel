//
//  ZLListViewModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSectionModel.h"
#import "ZLCellModel.h"

@interface ZLListViewModel : NSObject
@property (strong, nonatomic) NSMutableArray *sectionModels;
@property (strong, nonatomic) __kindof ZLSectionModel *lastsection;

// section
- (void)addSectionModel:(__kindof ZLSectionModel *)sectionmodel;
- (void)addSectionModels:(NSArray<__kindof ZLSectionModel *>*)sectionAry;
- (void)insertSectionModel:(__kindof ZLSectionModel *)sectionmodel atIndex:(NSUInteger)index;
- (void)insertSectionModels:(NSArray<__kindof ZLSectionModel *> *)sectionmodels atIndex:(NSUInteger)index;
- (void)deleteSectionModel:(__kindof ZLSectionModel *)sectionmodel;
- (void)deleteSectionModels:(NSArray<__kindof ZLSectionModel *>*)models;
- (void)deleteSectionModelAtIndex:(NSUInteger)index;

// cellmodel 提供方便快捷增加cell的方法
- (void)addCellModel:(__kindof ZLCellModel *)cellmodel;
- (void)addCellModels:(NSArray<__kindof ZLCellModel *>*)models;
- (void)insertCellModel:(__kindof ZLCellModel *)cellmodel atIndex:(NSUInteger)index;
- (void)insertCellModels:(NSArray<__kindof ZLCellModel *> *)cellmodels atIndex:(NSUInteger)index;
- (void)deleteCellModel:(__kindof ZLCellModel *)cellmodel;
- (void)deleteCellModelAtIndex:(NSUInteger)index;


@end
