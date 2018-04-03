//
//  ZLLblSectionModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLLblSectionModel.h"

@implementation ZLLblSectionModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headClass = [ZlSectionLblView class];
//        self.footClass = [ZlSectionLblView class];
    }
    return self;
}

@end

@interface ZlSectionLblView ()
@property (strong, nonatomic) UILabel *titleLbl;
@end

@implementation ZlSectionLblView
DEF_SINGLETON(ZlSectionLblView);
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupview];
    }
    return self;
}

- (void)setupview {
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.titleLbl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLbl.frame = CGRectMake(50, 10, 200, 30);
}

- (void)setSectionModel:(ZLLblSectionModel *)sectionModel {
    _sectionModel = sectionModel;
    self.titleLbl.text = sectionModel.headstr;
    
}

+ (CGFloat)heightWithTableview:(UITableView *)tableview sectionModel:(ZLTableviewSectionModel *)sectionmodel {
    CGFloat height = [self dynamicHeightWithTableview:tableview section:sectionmodel sharedView:[self sharedInstance] heightblock:^CGFloat(UITableView *tableview, ZLLblSectionModel *model, ZlSectionLblView *view) {
        return 50;
    }];
    return height;
}
@end
