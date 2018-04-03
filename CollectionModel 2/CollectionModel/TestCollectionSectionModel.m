//
//  TestCollectionSectionModel.m
//  CollectionModel
//
//  Created by Abe on 2018/3/15.
//  Copyright © 2018年 heimavista. All rights reserved.
//

#import "TestCollectionSectionModel.h"

@implementation TestCollectionSectionModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headclass = [TestCollectionSectionView class];
    }
    return self;
}

@end

@interface TestCollectionSectionView ()
@property (strong, nonatomic) UILabel *headlbl;
@end

@implementation TestCollectionSectionView
DEF_SINGLETON(TestCollectionSectionView);
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.headlbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 30)];
        self.headlbl.textColor = [UIColor blackColor];
        [self addSubview:self.headlbl];
    }
    return self;
}

- (void)setSectionModel:(TestCollectionSectionModel *)sectionModel {
    _sectionModel = sectionModel;
    self.headlbl.text = sectionModel.headstr;
}

+ (CGSize)viewSizeWithCollectionView:(UICollectionView *)collectionview model:(__kindof ZLCollectionSectionModel *)sectionModel {
    return [self dynamicsizeWithCollectionview:collectionview sectionmodel:sectionModel shareview:[self sharedInstance] sizeblock:^CGSize(UICollectionView *collectionview, ZLCollectionSectionModel *sectionmodel, UICollectionReusableView *shareview) {
        return CGSizeMake(collectionview.frame.size.width, 50);
    }];
}
@end
