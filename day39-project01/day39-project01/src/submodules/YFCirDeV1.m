
//
//  YFCirDeV1.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCirDeV1.h"
#import "YFCDV1Top.h"
#import "YFGoodHV.h"
#import "YFCDV1Cell.h"
#import "YFCDV1Pop.h"
#import "YFHomeVC.h"

#define celliden @"v1celliden"
#define headeriden @"v1headeriden"

@interface YFCirDeV1 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)YFCDV1Top *top;
@property (nonatomic,strong)UITableView *tv;
@end

@implementation YFCirDeV1
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.top=[[YFCDV1Top alloc] initWithFrame:(CGRect){0,0,self.w,44}];
        [self addSubview:self.top];
        self.tv=[[UITableView alloc] initWithFrame:(CGRect){0,self.top.b,self.w,self.h-self.top.b} style:UITableViewStylePlain];
        [self addSubview:self.tv];
        self.tv.delegate=self;
        self.tv.dataSource=self;
        self.tv.rowHeight=92;
        self.tv.separatorStyle=0;
        [self.tv registerClass:[YFCDV1Cell class] forCellReuseIdentifier:celliden];
        [self.tv registerClass:[YFGoodHV class] forHeaderFooterViewReuseIdentifier:headeriden];
        [self loadDatas];
        [self.top.area addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)onClick:(UIButton *)sender{
    if(sender==self.top.area){
       YFCDV1Pop *pop= [[YFCDV1Pop alloc] initWithFrame:(CGRect){sender.x,sender.b,sender.w*1.6,self.h-sender.b}];
        [pop setDatas:@[@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1",@"地区1"]];
        [pop setOnClick:^(NSInteger idx) {
            NSLog(@"%ld",idx);
        }];
        [pop setOnStateChange:^(BOOL show) {
            sender.selected=show;
        }];
        
        [pop show2v:self];
        
    }
}

-(void)loadDatas{
    [self setDict:iRes4dict(@"cirde.plist")];
}


-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    [self.tv reloadData];
}

#pragma mark  UITableViewDelegate&DataSource
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    YFGoodHV *hv=[tableView dequeueReusableHeaderFooterViewWithIdentifier:headeriden];
    hv.lab.text=section?@"猜你喜欢":@"热门酒店";
    hv.backgroundColor=[UIColor lightGrayColor];
    return hv;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?[self.dict[@"guess"] count]:[self.dict[@"hot"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFCDV1Cell *cell=[tableView dequeueReusableCellWithIdentifier:celliden];
    cell.dict=indexPath.section?self.dict[@"guess"][indexPath.row]:self.dict[@"hot"][indexPath.row];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dict?2:0;
}

@end
