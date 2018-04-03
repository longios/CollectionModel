//
//  ZLSectionModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLSectionModel.h"
#import "ZLListViewModel.h"

@interface ZLSectionModel ()
@property (assign, nonatomic) NSInteger privateSection;
@end

@implementation ZLSectionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.privateSection = -1;
    }
    return self;
}

- (void)addCellModel:(__kindof ZLCellModel *)cellmodel {
    [self orignCellModelWithCellModels:@[cellmodel]];
    [self.cellModels addObject:cellmodel];
}
- (void)addCellModels:(NSArray<__kindof ZLCellModel *>*)cellmodels {
    [self orignCellModelWithCellModels:cellmodels];
    [self.cellModels addObjectsFromArray:cellmodels];
}
- (void)insertCellModel:(__kindof ZLCellModel *)cellModel atIndex:(NSUInteger)index {
    [self orignCellModelWithCellModels:@[cellModel]];
    if(index < self.cellModels.count) {
        [self.cellModels insertObject:cellModel atIndex:index];
    }else {
        [self addCellModel:cellModel];
    }
    [self resetCellModelsIndexpath];
}
- (void)insertCellModels:(NSArray<__kindof ZLCellModel *> *)cellmodels atIndex:(NSUInteger)index {
    [self orignCellModelWithCellModels:cellmodels];
    if(index < self.cellModels.count) {
        for(int i=0 ;i<cellmodels.count; i++) {
            [self.cellModels insertObject:cellmodels[i] atIndex:index+i];
        }
    }else {
        for(int i=0; i<cellmodels.count; i++) {
            [self.cellModels addObjectsFromArray:cellmodels];
        }
    }
    [self resetCellModelsIndexpath];
}
- (void)deleteCellModel:(__kindof ZLCellModel *)cellmodel {
    [self.cellModels removeObject:cellmodel];
    [self resetCellModelsIndexpath];
}
- (void)deleteCellModelAtIndex:(NSUInteger)index {
    if(index < self.cellModels.count) {
        [self.cellModels removeObjectAtIndex:index];
    }
    [self resetCellModelsIndexpath];
}

- (void)removeAllCellModels {
    [self.cellModels removeAllObjects];
}

// 子类实现
- (void)refresh {
}

- (ZLCellModel *)cellModelAtIndex:(NSUInteger)index {
    if(index < self.cellModels.count) {
        return self.cellModels[index];
    }
    return nil;
}

- (void)resetsection {
    self.privateSection = [self.viewmodel.sectionModels indexOfObject:self];
    [self resetCellModelsIndexpath];
}

#pragma mark "Private"
- (void)orignCellModelWithCellModels:(NSArray *)cellmodels {
    for(ZLCellModel *cellmodel in cellmodels) {
        cellmodel.sectionModel = self;
        cellmodel.viewmodel = self.viewmodel;
    }
}

- (void)resetCellModelsIndexpath {
    for(ZLCellModel *cellmodel in self.cellModels) {
        [cellmodel resetIndexPath];
    }
}

#pragma mark "Lazy"
- (NSMutableArray *)cellModels {
    if(!_cellModels) {
        _cellModels = [NSMutableArray array];
    }
    return _cellModels;
}

- (NSUInteger)section {
    if(self.privateSection < 0) {
        self.privateSection = [self.viewmodel.sectionModels indexOfObject:self];
    }
    return self.privateSection;
}

@end
