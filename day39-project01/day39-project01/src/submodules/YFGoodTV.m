//
//  YFGoodTV.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFGoodTV.h"
#import "YFGoodHV.h"
#import "YFGoodCell0.h"
#import "YFGoodCell1.h"
#import "YFGoodCell2.h"

#define celliden0 @"goodcelliden0"
#define celliden1 @"goodcelliden1"
#define celliden2 @"goodcelliden2"
#define headeriden @"goodheaderiden"
@interface YFGoodTV ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation YFGoodTV



-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame style:UITableViewStyleGrouped]){
        self.delegate=self;
        self.dataSource=self;
        [self registerClass:[YFGoodCell0 class] forCellReuseIdentifier:celliden0];
        [self registerClass:[YFGoodCell1 class] forCellReuseIdentifier:celliden1];
        [self registerClass:[YFGoodCell2 class] forCellReuseIdentifier:celliden2];
        [self registerClass:[YFGoodHV class] forHeaderFooterViewReuseIdentifier:headeriden];
        self .separatorStyle=0;
        [self setEstimatedRowHeight:100];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dict?3:0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section==2?10:1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section==0)
        return 0;
    YFGoodHV *hfv=[tableView dequeueReusableHeaderFooterViewWithIdentifier:headeriden];
    hfv.lab.textColor=iColor(218, 96, 114, 1);
    hfv.lab.text=section==1?@"商家信息":@"你可能喜欢";
    return hfv;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==2){
        return 100;
    }else if(indexPath.section==1){
        return 55;
    }else
        return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
        return .1;
    else
        return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        YFGoodCell0 *cell=[tableView dequeueReusableCellWithIdentifier:celliden0];
        [cell setDict:self.dict];
        return cell;
    }else if(indexPath.section==1){
        YFGoodCell1 *cell=[tableView dequeueReusableCellWithIdentifier:celliden1];
        cell.dict=self.dict;
        return cell;
    }else{
        YFGoodCell2 *cell=[tableView dequeueReusableCellWithIdentifier:celliden2];
        cell.dict=0;
        return cell;
    }
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    [self reloadData];
}
@end
