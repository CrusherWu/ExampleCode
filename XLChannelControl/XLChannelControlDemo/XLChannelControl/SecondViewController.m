//
//  SecondViewController.m
//  XLChannelControlDemo
//
//  Created by 1hhd on 17/4/21.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "SecondViewController.h"
#import "XLChannelItem.h"
#import "XLChannelHeader.h"
//菜单列数
static NSInteger ColumnNumber = 4;
//横向和纵向的间距
static CGFloat CellMarginX = 15.0f;
static CGFloat CellMarginY = 10.0f;

@interface SecondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat cellWidth = (self.view.bounds.size.width - (ColumnNumber + 1) * CellMarginX)/ColumnNumber;
    flowLayout.itemSize = CGSizeMake(cellWidth,cellWidth/2.0f);
    flowLayout.sectionInset = UIEdgeInsetsMake(CellMarginY, CellMarginX, CellMarginY, CellMarginX);
    flowLayout.minimumLineSpacing = CellMarginY;
    flowLayout.minimumInteritemSpacing = CellMarginX;
    flowLayout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 40);
    
    
//    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.showsHorizontalScrollIndicator = false;
//    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[XLChannelItem class] forCellWithReuseIdentifier:@"XLChannelItem"];
    [_collectionView registerClass:[XLChannelHeader class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"XLChannelHeader"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CollectionViewDelegate&DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 40;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    XLChannelHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"XLChannelHeader" forIndexPath:indexPath];
    
        headerView.title = @"已选频道";
        headerView.subTitle = @"按住拖动调整排序";
    return headerView;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"XLChannelItem";
    XLChannelItem* item = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        item.title = @"dfjhkasjfskjdfsakjhdfhaskjdhfkjashdfkjsahdkjfhsadkjhgkjsahdkjg";
    }else
        item.title = @"ddd";
    return  item;
}

@end
