//
//  TestCellModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "TestCellModel.h"

@implementation TestCellModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClass = [TestCell class];
    }
    return self;
}

@end

@implementation TestCell

DEF_SINGLETON(TestCell);

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSLog(@"setup cell");
    }
    return self;
}

- (void)setCellModel:(TestCellModel *)cellModel {
    _cellModel = cellModel;
    self.textLabel.text = cellModel.testStr;
}

+ (CGFloat)cellHeightWithTableview:(UITableView *)tableview model:(__kindof ZLTableviewCellModel *)model {
    CGFloat height = [self dynamicHeightWithTableview:tableview cellmodel:model sharedCell:[self sharedInstance] heightBlock:^CGFloat(UITableView *tableview, __kindof ZLTableviewCellModel *cellmodel, UITableViewCell *cell) {
        return arc4random()%40 + 40;
    }];
    return height;
}

@end
