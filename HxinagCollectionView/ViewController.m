//
//  ViewController.m
//  HxinagCollectionView
//
//  Created by 王佳敏 on 2018/4/25.
//  Copyright © 2018年 王佳敏. All rights reserved.
//

#import "ViewController.h"
#import "DaojuCell.h"
#import "BCCollectionViewHorizontalLayout.h"

//屏幕高度
#define Wind_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
//屏幕宽度
#define Wind_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_SCALE ([ UIScreen mainScreen ].bounds.size.width/320)
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mianCollView;
@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (strong,nonatomic) BCCollectionViewHorizontalLayout *layout2;
@property(nonatomic, strong) NSArray *items;
@property(nonatomic, assign) NSUInteger pageCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mackCollection];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)mackCollection
{
    
    _items = @[@"a", @"b", @"c", @"4", @"5", @"b", @"c", @"4", @"5", @"b", @"c", @"4", @"5",@"b", @"c", @"4", @"5",@"b", @"c", @"4", @"5"];
    NSLog(@"%f", _items.count / 9.0);
    
    _pageCount = _items.count;
    
    //一排显示3个,3排就是9个
    while (_pageCount % 9 != 0) {
        ++_pageCount;
        NSLog(@"66666=====%zd", _pageCount);
    }
    NSLog(@"page=========%zd", _pageCount);
    self.page.numberOfPages = _pageCount / 9.0;
    //去掉弹簧效果
    self.mianCollView.showsVerticalScrollIndicator = NO;
    self.mianCollView.showsHorizontalScrollIndicator = NO;
    
    _layout2 = [[BCCollectionViewHorizontalLayout alloc]init];
    
    _layout2.itemSize = CGSizeMake((Wind_WIDTH)/3, (self.mianCollView.frame.size.height)/3);
    _layout2.minimumInteritemSpacing = 0*SCREEN_SCALE;
    _layout2.minimumLineSpacing = 0*SCREEN_SCALE;
    _layout2.headerReferenceSize = CGSizeMake(0*SCREEN_SCALE, 0*SCREEN_SCALE);
    _layout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.mianCollView.collectionViewLayout = _layout2;
    
    
    self.mianCollView.pagingEnabled = YES;
    //注册coll, coll是Xib
    [self.mianCollView registerNib:[UINib nibWithNibName:@"DaojuCell" bundle:nil] forCellWithReuseIdentifier:@"DaojuCell"];
    
    self.mianCollView.delegate = self;
    self.mianCollView.dataSource = self;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _pageCount;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * CellIdentifier = @"DaojuCell";
    DaojuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.item >= _items.count)
    {
        cell.dangbanLib.hidden = NO;
        
    }else
    {
        cell.dangbanLib.hidden = YES;
        
    }
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.item >= _items.count) {
        NSLog(@"点击了====空白");
    } else {
        NSLog(@"点击了=====%ld",indexPath.row);
        
    }
    
    
}
- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    
    //获得页码
    CGFloat doublePage = scrollView.contentOffset.x/Wind_WIDTH;
    int intPage = (int)(doublePage +0.5);
    //设置页码
    self.page.currentPage= intPage;
}
@end
