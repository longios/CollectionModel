//
//  ViewController.m
//  CollectionModel
//
//  Created by Abe on 2018/3/12.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "ViewController.h"
#import "ZLTabViewModel.h"
#import "ZLLblSectionModel.h"
#import "TestCellModel.h"
#import "ZLCollectionViewModel.h"
#import "TestCollectionModel.h"
#import "TestCollectionSectionModel.h"

@interface ViewController ()<UITableViewDelegate, UICollectionViewDelegate>
@property (strong, nonatomic) ZLTabViewModel *model;
@property (strong, nonatomic) UITableView *tableview;
@property (strong, nonatomic) UIButton *btn;
@property (strong, nonatomic) NSArray *modelAry;
@property (strong, nonatomic) UIButton *btn2;

@property (strong, nonatomic) ZLCollectionViewModel *colModel;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowlayout;
@property (strong, nonatomic) UICollectionView *collectionview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 测试tableviewmodel
//    [self testTableview];

    // 测试collectionviewModel
    [self testCollectionView];

    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 450, 100, 30)];
    self.btn.backgroundColor = [UIColor greenColor];
    [self.btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    NSLog(@"%@", self.model);

    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 100, 30)];
    self.btn2.backgroundColor = [UIColor blueColor];
    [self.btn2 addTarget:self action:@selector(btn2click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
}

- (void)testTableview {
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 300) style:UITableViewStyleGrouped];
    self.tableview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.tableview];
    self.model = [[ZLTabViewModel alloc] initWithTableview:self.tableview];
    self.model.forwardDelegate = self;
    [self addtestmodel];
}

- (void)testCollectionView {
    self.flowlayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowlayout.minimumLineSpacing = 10;
    self.flowlayout.minimumInteritemSpacing = 10;
    self.collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 300) collectionViewLayout:self.flowlayout];
    self.collectionview.backgroundColor = [UIColor yellowColor];
    self.colModel = [[ZLCollectionViewModel alloc] initWithCollectionView:self.collectionview];
    self.colModel.forwardDelegate = self;
    [self.view addSubview:self.collectionview];
    [self addtestCollectionModel];
}

- (void)btnclick:(UIButton *)btn {
    /*  // 测试refresh
    TestCellModel *tempmodel = self.modelAry[5];
    tempmodel.testStr = @"refresh cell";
    [tempmodel refresh];
     */

    /* // 测试insert
    TestCellModel *tempmodel = [[TestCellModel alloc] init];
    tempmodel.testStr = @"insert temp model";
    [self.model insertCellModel:tempmodel atIndex:4];
    [self.model reloadTabData];
     */

}

- (void)btn2click:(UIButton *)btn {
    /* // 测试删除
    [self.model deleteCellModelAtIndex:4];
    [self.model reloadTabData];
     */
}

- (void)addtestmodel {
    NSMutableArray *mary = [NSMutableArray array];
    ZLLblSectionModel *testsection = [[ZLLblSectionModel alloc] init];
    testsection.headstr = @"test Head section1";
    [self.model addSectionModel:testsection];
    for(int i=0 ;i<10; i++) {
        NSString *str = [NSString stringWithFormat:@"teststr%d",i];
        TestCellModel *model= [[TestCellModel alloc] init];
        model.cellClickBlock = ^(TestCellModel *cellModel) {
            NSLog(@"%@",cellModel.testStr);
        };
        model.testStr = str;
        [mary addObject:model];
        [self.model addCellModel:model];
    }

    ZLLblSectionModel *section2 = [[ZLLblSectionModel alloc] init];
    section2.headstr = @"test head section2";
    [self.model addSectionModel:section2];
    TestCellModel *testmodel = [[TestCellModel alloc] init];
    testmodel.testStr = @"section 2";
    [self.model addCellModel:testmodel];
    self.modelAry = [mary copy];
    [self.model reloadTabData];
    NSLog(@"%@",self.model);
    //测试输出 sectionmodel的section  cellmodel的indexpath
    [self printIndexpath];
}

- (void)addtestCollectionModel {
    TestCollectionSectionModel *sectionmodel = [[TestCollectionSectionModel alloc] init];
    sectionmodel.headstr = @"这是collection 头部";
    [self.colModel addSectionModel:sectionmodel];
    for(int i=0; i<20; i++) {
        TestCollectionModel *model = [[TestCollectionModel alloc] init];
        model.image = [UIImage imageNamed:@"1.jpg"];
        [self.colModel addCellModel:model];
    }
    [self.colModel reloadTabData];
}

- (void)printIndexpath {
    for(ZLTableviewSectionModel *sectionmodel in self.model.sectionModels) {
        NSLog(@"%ld",sectionmodel.section);
        for(ZLTableviewCellModel *cellmodel in sectionmodel.cellModels) {
            NSLog(@"cellmodel indexpath row:%ld  section:%ld", cellmodel.indexpath.row, cellmodel.indexpath.section);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

  // 测试 forwardDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    ZLLog(@"%f  , %f", scrollView.contentOffset.x , scrollView.contentOffset.y);
}


@end
