
//
//  YFHomeHV.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeHV.h"
#import "iCarousel.h"
#import "UIImageView+WebCache.h"
#import "DSHomeModel.h"
#import "YFHomeHeadDetailVC.h"

@interface YFHomeHV ()<iCarouselDataSource,iCarouselDelegate>
@property (nonatomic,strong)iCarousel *icv;
@property (nonatomic,strong)UIPageControl *pc;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation YFHomeHV

-(void)initUI{
    self.icv=[[iCarousel alloc] initWithFrame:self.bounds];
    [self addSubview:_icv];
    _icv.delegate=self;
    _icv.dataSource=self;
    _icv.pagingEnabled=YES;
    [_icv setType:iCarouselTypeLinear];
    
    self.pc=[[UIPageControl alloc] init];
    [self addSubview:self.pc];
    [self.pc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-15);
        make.bottom.equalTo(@0);
    }];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}



- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.datas.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if(!view){
        
        static CGFloat coverh=35;
        view =[[UIImageView alloc] initWithFrame:self.icv.bounds];
        
        UILabel *lab=[[UILabel alloc] initWithFrame:(CGRect){0,view.h-coverh,view.w,coverh}];
        [view addSubview:lab];
        [lab setBackgroundColor:iColor(100, 100, 100, .5)];
  
        [lab setTextColor:iColor(255, 255, 255, 1)];
        lab.tag=1;
    }
    
    DSFocusModel *m=self.datas[index];
    [(UIImageView *)view setImage:img(@"guide_2")];
    [(UILabel *)[view viewWithTag:1] setText:[@"   " stringByAppendingString:m.title]];
    return view;
}



- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value *1;
        }
        case iCarouselOptionFadeMax:
        {
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
    
}

-(void)startTimer{
    [self.timer invalidate];
    self.timer=[NSTimer timerWithTimeInterval:2 target:self selector:@selector(icarScroll) userInfo:0 repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
- (void)carouselWillBeginDragging:(iCarousel *)carousel{
    [self.timer invalidate];
    self.timer=0;
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

-(void)icarScroll{
    [self.icv scrollToItemAtIndex:[self.icv currentItemIndex]+1 animated:YES];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    YFHomeHeadDetailVC *vc=[[YFHomeHeadDetailVC alloc] init];
    DSFocusModel *m=self.datas[index];
    vc.url=m.link;
    [UIViewController pushVC:vc];
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    [self.pc setCurrentPage:carousel.currentItemIndex];
}

-(void)appendDatas:(NSArray *)datas{
    [self.datas addObjectsFromArray:datas];
    [self.pc setNumberOfPages:self.datas.count];
    [self startTimer];
    [self.icv reloadData];
}

iLazy4Ary(datas, _datas)

@end
