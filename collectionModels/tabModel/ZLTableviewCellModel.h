//
//  ZLTableviewCellModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/13.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLCellModel.h"
#import "ZLTableViewCellModelProtocol.h"
@class ZLTabViewModel;
@class ZLTableviewCellModel;
@class ZLTableviewSectionModel;

typedef void (^CellClick)(__kindof ZLTableviewCellModel *cellModel);
@interface ZLTableviewCellModel : ZLCellModel
@property (weak, nonatomic) ZLTabViewModel *trueviewModel;
@property (weak, nonatomic) ZLTableviewSectionModel *truesectionModel;
// 复用时候的identity
@property (strong, nonatomic) NSString *identity;
// 缓存高度 用于记录已经算出的高度  在refresh的时候必须重置为0  为0的情况下才会去重新计算
@property (assign, nonatomic) CGFloat cellheight;
@property (copy, nonatomic) CellClick cellClickBlock;
@property (strong, nonatomic) Class<ZLTableViewCellModelProtocol> cellClass;
@property (assign, nonatomic) UITableViewCellStyle cellstyle;
@property (weak, nonatomic) UITableViewCell<ZLTableViewCellModelProtocol> *cell;

- (void)refresh;


@end
