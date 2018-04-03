//
//  ZLListViewModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLListViewModel.h"

@interface ZLListViewModel ()
@end

@implementation ZLListViewModel
#pragma mark "open"
- (void)addSectionModel:(__kindof ZLSectionModel *)sectionmodel {
    sectionmodel.viewmodel = self;
    [self.sectionModels addObject:sectionmodel];
}
- (void)addSectionModels:(NSArray<__kindof ZLSectionModel *>*)sectionAry {
    [self orignSectionmodelsWithSectionModels:sectionAry];
    [self.sectionModels addObjectsFromArray:sectionAry];
}
- (void)insertSectionModel:(__kindof ZLSectionModel *)sectionmodel atIndex:(NSUInteger)index {
    sectionmodel.viewmodel = self;
    if(index < self.sectionModels.count) {
        [self.sectionModels insertObject:sectionmodel atIndex:index];
    }else {
        [self addSectionModel:sectionmodel];
    }
    [self resetSectionsSection];
}
- (void)insertSectionModels:(NSArray<__kindof ZLSectionModel *> *)sectionmodels atIndex:(NSUInteger)index {
    [self orignSectionmodelsWithSectionModels:sectionmodels];
    if(index < self.sectionModels.count) {
        for(int i=0 ;i<sectionmodels.count; i++) {
            [self.sectionModels insertObject:sectionmodels[i] atIndex:index+i];
        }
    }else {
        [self addSectionModels:sectionmodels];
    }
    [self resetSectionsSection];

}
- (void)deleteSectionModel:(__kindof ZLSectionModel *)sectionmodel {
    [self.sectionModels removeObject:sectionmodel];
    [self resetSectionsSection];
}
- (void)deleteSectionModels:(NSArray<__kindof ZLSectionModel *>*)models {
    [self orignSectionmodelsWithSectionModels:models];
    [self.sectionModels removeObjectsInArray:models];
    [self resetSectionsSection];
}
- (void)deleteSectionModelAtIndex:(NSUInteger)index {
    if(index < self.sectionModels.count) {
        [self.sectionModels removeObjectAtIndex:index];
    }
    [self resetSectionsSection];

}
// cellmodel 提供方便快捷增加cell的方法
- (void)addCellModel:(__kindof ZLCellModel *)cellmodel {
    [self.lastsection addCellModel:cellmodel];
}
- (void)addCellModels:(NSArray<__kindof ZLCellModel *>*)models {
    [self.lastsection addCellModels:models];
}
- (void)insertCellModel:(__kindof ZLCellModel *)cellmodel atIndex:(NSUInteger)index {
    [self.lastsection insertCellModel:cellmodel atIndex:index];
}
- (void)insertCellModels:(NSArray<__kindof ZLCellModel *> *)cellmodels atIndex:(NSUInteger)index {
    [self.lastsection insertCellModels:cellmodels atIndex:index];
}
- (void)deleteCellModel:(__kindof ZLCellModel *)cellmodel {
    [self.lastsection deleteCellModel:cellmodel];
}
//- (void)deleteCellModels:(NSArray<__kindof ZLCellModel *> *)models {
//
//}
- (void)deleteCellModelAtIndex:(NSUInteger)index {
    [self.lastsection deleteCellModelAtIndex:index];
}

- (void)reloadSectionAtIndex:(NSUInteger)index {
    if(index < self.sectionModels.count) {
        ZLSectionModel *section = [self.sectionModels objectAtIndex:index];
        [section refresh];
    }
}

#pragma mark private
- (ZLCellModel *)cellModelAtIndexPath:(NSIndexPath *)indexpath {
    ZLSectionModel *section = [self.sectionModels objectAtIndex:indexpath.section];
    ZLCellModel *model = [section cellModelAtIndex:indexpath.row];
    return model;
}

- (void)orignSectionmodelsWithSectionModels:(NSArray *)sectionmodels {
    for(ZLSectionModel *sectionmodel in sectionmodels) {
        sectionmodel.viewmodel = self;
    }
}

- (void)resetSectionsSection {
    for(ZLSectionModel *section in self.sectionModels) {
        [section resetsection];
    }
}

#pragma mark setget
- (NSMutableArray<ZLSectionModel *> *)sectionModels {
    if(!_sectionModels) {
        _sectionModels = [NSMutableArray array];
    }
    return _sectionModels;
}



@end
