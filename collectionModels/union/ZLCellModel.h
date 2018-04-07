//
//  ZLCellModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLListViewModel;
@class ZLSectionModel;

@interface ZLCellModel : NSObject
@property (weak, nonatomic) ZLListViewModel *viewmodel;
@property (weak, nonatomic) ZLSectionModel *sectionModel;
@property (strong, nonatomic) NSIndexPath *indexpath;
- (void)resetIndexPath;
@end
