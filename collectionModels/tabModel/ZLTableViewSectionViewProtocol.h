//
//  ZLTableViewSectionViewProtocol.h
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZLTableviewSectionModel;

@protocol ZLTableViewSectionViewProtocol <NSObject>
@property (strong, nonatomic) __kindof ZLTableviewSectionModel *sectionModel;
+ (CGFloat)heightWithTableview:(UITableView *)tableview sectionModel:(ZLTableviewSectionModel *)sectionmodel;

@end
