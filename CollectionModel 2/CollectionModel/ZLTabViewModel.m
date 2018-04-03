//
//  ZLTabViewModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLTabViewModel.h"
#import "ZLTableViewCellModelProtocol.h"
#import "ZLTableViewSectionViewProtocol.h"


@interface ZLTabViewModel ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ZLTabViewModel
- (instancetype)initWithTableview:(UITableView *)tableview
{
    self = [super init];
    if (self) {
        self.tableview = tableview;
    }
    return self;
}

#pragma mark "Open"

- (void)reloadTabData {
    [self.tableview reloadData];
}

- (void)reloadSectionAtIndex:(NSUInteger)index {
    if(index < self.sectionModels.count) {
        ZLTableviewSectionModel *section = [self.sectionModels objectAtIndex:index];
        [section refresh];
    }
}

#pragma mark private
- (ZLTableviewCellModel *)cellModelAtIndexPath:(NSIndexPath *)indexpath {
    ZLTableviewSectionModel *section = [self.sectionModels objectAtIndex:indexpath.section];
    ZLTableviewCellModel *model = [section cellModelAtIndex:indexpath.row];
    return model;
}

#pragma mark "setget"

- (void)setTableview:(UITableView *)tableview {
    _tableview = tableview;
    tableview.delegate = self;
    tableview.dataSource = self;
}

- (void)setForwardDelegate:(id<UITableViewDelegate>)forwardDelegate {
    _forwardDelegate = forwardDelegate;
    if(self.tableview.delegate==self){
        self.tableview.delegate = nil;
        self.tableview.delegate = self;//重新赋值一次,使得scrollview重新判断scrollViewDidScroll:方法的有无
    }
}

- (ZLTableviewSectionModel *)lastsection {
    if(self.sectionModels.count == 0) {
        // 创建一个section
        ZLTableviewSectionModel *section = [[ZLTableviewSectionModel alloc] init];
        [self addSectionModel:section];
    }
    return [self.sectionModels lastObject];
}

#pragma mark "runtime"

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if([self.forwardDelegate respondsToSelector:aSelector]) {
        return self.forwardDelegate;
    }else if([self.forwardDatasource respondsToSelector:aSelector]) {
        return self.forwardDatasource;
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 重写responder 使tableview响应  fowwardelegate  forwarddatasource  然后通过重定向将其导到forwarddelegate 和 forwarddatasource 解决
- (BOOL)respondsToSelector:(SEL)selector {
    if ([super respondsToSelector:selector]) {
        return YES;
    } else {
        if([self.forwardDelegate respondsToSelector:selector]){
            return YES;
        }else if([self.forwardDatasource respondsToSelector:selector]){
            return YES;
        }
    }
    return NO;
}
#pragma mark "UITableViewDelegate"

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZLTableviewSectionModel *sectionmodel = self.sectionModels[section];
    ZLLog(@"cellnum: %ld", sectionmodel.cellModels.count);
    return sectionmodel.cellModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    ZLLog(@"sectionnum: %ld",self.sectionModels.count);
    return self.sectionModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLTableviewCellModel *model = [self cellModelAtIndexPath:indexPath];
    UITableViewCell<ZLTableViewCellModelProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:model.identity];
    if(!cell) {
        Class cellclass = model.cellClass;
        cell = [[cellclass alloc] initWithStyle:model.cellstyle reuseIdentifier:model.identity];
    }
    cell.cellModel = model;
    model.cell = cell;
    return cell;
}


#pragma mark "UITableViewDataSource"
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLTableviewCellModel *model = [self cellModelAtIndexPath:indexPath];
    if(model.cellheight != 0) {
        return model.cellheight;
    }
    Class<ZLTableViewCellModelProtocol> cls = model.cellClass;
    CGFloat height = [cls cellHeightWithTableview:tableView model:model];
    if(height <= 0) {
        height = 44;
    }
    model.cellheight = height;
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ZLTableviewSectionModel *sectionmodel = self.sectionModels[section];
    if(sectionmodel.headClass) {
        Class headcls = sectionmodel.headClass;
        return [headcls heightWithTableview:tableView sectionModel:sectionmodel];
    }
    return 0;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    ZLTableviewSectionModel *sectionmodel = self.sectionModels[section];
    if(sectionmodel.footClass) {
        Class footcls = sectionmodel.footClass;
        return [footcls heightWithTableview:tableView sectionModel:sectionmodel];
    }
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZLTableviewSectionModel *sectionmodel = self.sectionModels[section];
    if(sectionmodel.headClass) {
        Class headcls = sectionmodel.headClass;
        UIView<ZLTableViewSectionViewProtocol> *view = [[headcls alloc] init];
        view.sectionModel = sectionmodel;
        return view;
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ZLTableviewSectionModel *sectionmodel = self.sectionModels[section];
    if(sectionmodel.footClass) {
        Class footcls = sectionmodel.footClass;
        UIView<ZLTableViewSectionViewProtocol> *view = [[footcls alloc] init];
        view.sectionModel = sectionmodel;
        return view;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.forwardDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.forwardDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    // 自定义方法
    ZLTableviewCellModel *model = [self cellModelAtIndexPath:indexPath];
    if(model.cellClickBlock) {
        model.cellClickBlock(model);
    }
}

@end
