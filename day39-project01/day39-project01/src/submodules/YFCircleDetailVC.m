


//
//  YFCircleDetailVC.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCircleDetailVC.h"
#import "DSHomeModel.h"
#import "YFCirDeTopV.h"
#import "YFCirDeV0.h"
#import "YFCirDeV1.h"
#import "YFCirDeV2.h"
@interface YFCircleDetailVC ()<UIScrollViewDelegate>
@property (nonatomic,weak)YFCirDeTopV *topv;
@property (nonatomic,strong)YFCirDeV0 *v0;
@property (nonatomic,strong)YFCirDeV1 *v1;
@property (nonatomic,strong)YFCirDeV2 *v2;
@property (nonatomic,strong)UIScrollView *sv;
@end

@implementation YFCircleDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavtitleStr:iFormatStr(@"%@圈-AA",_m.title)];
    [self.view setBackgroundColor:iGlobalBG];
    [self initUI];
}

-(void)initUI{
    YFCirDeTopV *topv=[[YFCirDeTopV alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,32}];
    self.topv=topv;
    [self.view addSubview:self.topv];
    [self.topv setBackgroundColor:[UIColor whiteColor]];
    [self.topv setOnChange:^(NSInteger idx) {
        [UIView animateWithDuration:.3 animations:^{
            self.sv.contentOffset=(CGPoint){idx*self.sv.w,0};
        }];
    }];
    
    self.sv=[[UIScrollView alloc] initWithFrame:(CGRect){0,self.topv.b,self.view.w,self.view.h-self.topv.b}];
    _sv.bounces=NO;
    _sv.delegate=self;
    [self.view addSubview:_sv];
    [_sv setPagingEnabled:YES];
    
    self.v0=[[YFCirDeV0 alloc] initWithFrame:(CGRect){0,0,self.sv.size}];
    self.v1=[[YFCirDeV1 alloc] initWithFrame:(CGRect){self.sv.w,0,self.sv.size}];
    self.v2=[[YFCirDeV2 alloc] initWithFrame:(CGRect){self.sv.w*2,0,self.sv.size}];
    self.sv.contentSize=(CGSize){self.sv.w*3,0};
    [self.sv addSubview:self.v0];
    [self.sv addSubview:self.v1];
    [self.sv addSubview:self.v2];
    
    [self.v0 setBackgroundColor:[UIColor whiteColor]];
    [self.v1 setBackgroundColor:[UIColor whiteColor]];
    [self.v2 setBackgroundColor:[UIColor whiteColor]];
    [_sv setContentOffset:(CGPoint){self.sv.w,0}];
    [self.topv setTitles:@[@"咨询",@"商家",@"圈评"]];
   self. v2.vc=self;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.v2.tv reloadData];
}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.topv selectAtIdx:(int)(scrollView.contentOffset.x/scrollView.w) ani:YES]; ;
    
}

@end
