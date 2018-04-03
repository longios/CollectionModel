//
//  ZLCollectionSectionModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCollectionSectionModel.h"
#import "ZLCollectionViewModel.h"

@implementation ZLCollectionSectionModel

- (void)refresh {
    NSIndexSet *indexset = [NSIndexSet indexSetWithIndex:self.section];
    for(ZLCollectionCellModel *cellmodel in self.cellModels) {
        cellmodel.cellsize = CGSizeZero;
    }
    [self.trueviewmodel.collectionview reloadSections:indexset];
}

- (void)setViewmodel:(__kindof ZLListViewModel *)viewmodel {
    [super setViewmodel:viewmodel];
    self.trueviewmodel = viewmodel;
}

- (NSString *)identify {
    return NSStringFromClass([self class]);
}

@end
