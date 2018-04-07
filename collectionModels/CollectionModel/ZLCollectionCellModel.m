//
//  ZLCollectionCellModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCollectionCellModel.h"
#import "ZLCollectionViewModel.h"
#import "ZLCollectionSectionModel.h"

@implementation ZLCollectionCellModel


- (void)refresh {
    self.cellsize = CGSizeZero;
    [self.trueviewModel.collectionview reloadItemsAtIndexPaths:@[self.indexpath]];
}

#pragma mark "setget"

- (NSString *)identity {
    return NSStringFromClass([self class]);
}

- (void)setViewmodel:(ZLListViewModel *)viewmodel {
    [super setViewmodel:viewmodel];
    self.trueviewModel = (ZLCollectionViewModel *)viewmodel;
}

- (void)setSectionModel:(ZLSectionModel *)sectionModel {
    [super setSectionModel:sectionModel];
    self.truesectionModel = (ZLCollectionSectionModel *)sectionModel;
}

@end
