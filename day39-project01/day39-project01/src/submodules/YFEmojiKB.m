

//
//  YFEmojiKB.m
//  day39-project01
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFEmojiKB.h"
#import "YFEmojiCV.h"

static NSString *const celliden=@"emojimaincelliden";

@interface YFEmojiKB ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *cv;
@property (nonatomic,strong)UIPageControl *pc;
@end

@implementation YFEmojiKB

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
        [lo setMinimumInteritemSpacing:0];
        [lo setMinimumLineSpacing:0];
        [lo setItemSize:self.bounds.size];
        [lo setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        self.cv=[[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:lo];
        self.cv.delegate=self;
        self.cv.dataSource=self;
        self.cv.pagingEnabled=YES;
        [self addSubview:self.cv];
        [self.cv setShowsHorizontalScrollIndicator:NO];
        [self.cv registerClass:[YFEmojiCV class] forCellWithReuseIdentifier:celliden];
        [self.cv setBackgroundColor:[UIColor clearColor]];
        
        self.pc=[[UIPageControl alloc]init];
        [self addSubview:self.pc];
        [self.pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.bottom.equalTo(@5);
        }];
        [self.pc setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
        [self.pc setPageIndicatorTintColor:[UIColor lightGrayColor]];
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YFEmojiCV *cell=[collectionView dequeueReusableCellWithReuseIdentifier:celliden forIndexPath:indexPath];
    cell.datas=self.datas[indexPath.row];
    cell.emojiClick=self.emojiClick;
    return cell;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pc.currentPage=scrollView.contentOffset.x/scrollView.w ;
}



-(void)appendDatas:(NSArray *)ary{
    [self.datas addObjectsFromArray:ary];
    [self.pc setNumberOfPages:self.datas.count];
    [self.cv reloadData];
}

iLazy4Ary(datas, _datas)
@end
