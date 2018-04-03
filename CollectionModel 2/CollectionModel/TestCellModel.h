//
//  TestCellModel.h
//  CollectionModel
//
//  Created by Abe on 2018/3/14.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ZLTableviewCellModel.h"
#import "ZLTableViewCellModelProtocol.h"

@interface TestCellModel : ZLTableviewCellModel
@property (strong, nonatomic) NSString *testStr;
@end

@interface TestCell: UITableViewCell <ZLTableViewCellModelProtocol>
@property (strong, nonatomic) TestCellModel *cellModel;
@end
