


//
//  YFCirDeV2.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCirDeV2.h"
#import "YFShopFV.h"
#import "YFCDV2Cell.h"
#import "YFCDV2HV.h"
#import "MJRefresh.h"



#define celliden @"v2celliden"
#define headeriden @"v2headeriden"
#define footeriden @"v2footeriden"

@interface YFCirDeV2 ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation YFCirDeV2
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.tv=[[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        self.tv.delegate=self;
        self.tv.dataSource=self;
        self.tv.separatorStyle=0;
        self.tv.rowHeight=UITableViewAutomaticDimension;
        self.tv.estimatedRowHeight=60;
        [self.tv registerClass:[YFCDV2Cell class] forCellReuseIdentifier:celliden];
        [self.tv registerClass:[YFCDV2HV class] forHeaderFooterViewReuseIdentifier:headeriden];
        [self.tv registerClass:[YFShopFV class] forHeaderFooterViewReuseIdentifier:footeriden];
        [self.tv setEstimatedSectionHeaderHeight:200];
        [self.tv setSectionHeaderHeight:UITableViewAutomaticDimension];
        [self.tv setSectionFooterHeight:42];
        [self addSubview:self.tv];
        [self.tv addFooterWithTarget:self action:@selector(loadMore)];
        [self.tv addHeaderWithTarget:self action:@selector(loadNew)];
        [self loadNew];
    }
    return self;
}



-(void)loadDatas:(BOOL)new{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_after(dispatch_time(0, 1e9), dispatch_get_main_queue(), ^{
            if(new)
               [self.datas removeAllObjects];
            [self appendDatas:iRes4ary(@"cirde2.plist")];
            [self.tv headerEndRefreshing];
            [self.tv footerEndRefreshing];
        });
    });
}
-(void)loadMore{
    [self loadDatas:NO];
    
}
-(void)loadNew{
    [self loadDatas:YES];

}


#pragma  mark delegate


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFCDV2Cell *cell=[tableView dequeueReusableCellWithIdentifier:celliden];

    cell.dict=self.datas[indexPath.section][@"comments"][indexPath.row];
    
    return cell;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    YFCDV2HV *fv=[tableView dequeueReusableHeaderFooterViewWithIdentifier:headeriden];
    [fv setDict:self.datas[section]];
    fv.btn.tag=section;
    [fv.btn addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
    return fv;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YFShopFV *fv=[tableView dequeueReusableHeaderFooterViewWithIdentifier:footeriden];
    [fv.contentView setBackgroundColor:iGlobalBG];
    [fv.btn setTitle:@"更多评论" forState:0];
    fv.btn.tag=section;
    [fv.btn addTarget:self action:@selector(loadMore:) forControlEvents:UIControlEventTouchUpInside];
    return fv;
}




-(void)comment:(UIButton *)sender{
    if(![YFUserInfo shared].islogin){
        [_vc showToast:@"先登录"];
        return;
    }
    NSString *text=self.datas[sender.tag][@"comment"];
    if(text.length<10){
        [_vc showToast:@"字数必须大于10"];
    }else{

        [self.datas[sender.tag][@"comments"] insertObject:@{@"name":[[YFUserInfo shared] getByKey:@"nick_name"],
                                         @"time":[[NSDate date] timeFormat2],
                                         @"comment":text,
                                         @"img": [[YFUserInfo shared] usericon]                                } atIndex:0];
        
        self.datas[sender.tag][@"comment"]=@"";
        [self.tv reloadData];
        dispatch_after(dispatch_time(0, .5e8), dispatch_get_main_queue(), ^{
            [self.tv scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:sender.tag] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        });
        
    }

}
-(void)loadMore:(UIButton *)btn{
    [self.datas[btn.tag][@"comm ents"] addObjectsFromArray:[self.datas[btn.tag][@"comments"] subarrayWithRange:(NSRange){0,1}]];
    [self.tv reloadData];
    dispatch_after(dispatch_time(0, .5e8), dispatch_get_main_queue(), ^{
        [self.tv scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:[self.datas[btn.tag][@"comments"] count]-1 inSection:btn.tag] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    });
}










- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas[section][@"comments"] count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}



-(void)appendDatas:(NSArray *)datas{
    for(NSDictionary *dict in datas){
        NSMutableDictionary *mdict=[NSMutableDictionary dictionaryWithDictionary:dict];
        mdict[@"comments"]=[NSMutableArray arrayWithArray:dict[@"comments"]];
        [self.datas addObject:mdict];
    }
    [self.tv reloadData];
}

iLazy4Ary(datas, _datas)
@end
