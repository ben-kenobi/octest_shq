





//
//  YFShopTv.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopTv.h"
#import "YFGoodHV.h"
#import "YFShopFV.h"
#import "YFShopCell0.h"
#import "YFShopCell2.h"
#import "YFGoodVC.h"

#define celliden0 @"shopcelliden0"
#define celliden1 @"shopcelliden1"
#define headeriden @"goodheaderiden"
#define footeriden @"goodfooteriden"
@interface YFShopTv ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)void(^checkDetail)(NSDictionary*goodinfo);
@end



@implementation YFShopTv

-(instancetype)initWithFrame:(CGRect)frame {
    if(self=[super initWithFrame:frame style:UITableViewStyleGrouped]){
        self.delegate=self;
        self.dataSource=self;
        [self registerClass:[YFShopCell0 class] forCellReuseIdentifier:celliden0];
        [self registerClass:[YFShopCell2 class] forCellReuseIdentifier:celliden1];
        [self registerClass:[YFGoodHV class] forHeaderFooterViewReuseIdentifier:headeriden];
        [self registerClass:[YFShopFV class] forHeaderFooterViewReuseIdentifier:footeriden];
        self .separatorStyle=0;
        [self setEstimatedRowHeight:80];
        __weak typeof (self)ws=self;
        [self setCheckDetail:^(NSDictionary *dict) {
            YFGoodVC *vc=[[YFGoodVC alloc]init];
            vc.goodinfo=dict;
            vc.shopinfo=ws.dict;
            [UIViewController pushVC:vc];
        }];
        [self setRowHeight:UITableViewAutomaticDimension];
    }
    return self;
}




#pragma mark datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?[self.comments count]:[self.goods count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dict?2:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        YFShopCell0 *cell=[tableView dequeueReusableCellWithIdentifier:celliden0];
        cell.dict=self.goods[indexPath.row];
        cell.checkDetail=self.checkDetail;
        return cell;
    }else{
        YFShopCell2 *cell=[tableView dequeueReusableCellWithIdentifier:celliden1];
        cell.dict=self.comments[indexPath.row];
        return cell;
    }
}


#pragma mark delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 39;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 43 ;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    YFGoodHV *hfv=[tableView dequeueReusableHeaderFooterViewWithIdentifier:headeriden];
    hfv.lab.textColor=iColor(218, 96, 114, 1);
    hfv.lab.text=section==1?@"用户评价":@"商品";
    return hfv;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YFShopFV *fv=[tableView dequeueReusableHeaderFooterViewWithIdentifier:footeriden];
    [fv.contentView setBackgroundColor:iGlobalBG];
    [fv.btn setTitle:section?@"更多评论":@"更多" forState:0];
    fv.btn.tag=section;
    [fv.btn addTarget:self action:@selector(loadMore:) forControlEvents:UIControlEventTouchUpInside];
    return fv;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [scrollView endEditing:true];
}





-(void)loadMore:(UIButton *)btn{
    if(self.loadMore)
        self.loadMore(btn.tag);
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    [self.goods addObjectsFromArray:dict[@"goods"]];
    [self.comments addObjectsFromArray:dict[@"comment_list"]];
    [self reloadData];
    
}

-(void)appendGoods:(NSArray *)goods{
    [self.goods addObjectsFromArray:goods];
    [self reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:0];
}


-(void)appendComments:(NSArray *)comments{
    [self.comments addObjectsFromArray:comments];
    [self reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:0];
}




iLazy4Ary(goods, _goods)
iLazy4Ary(comments, _comments)
@end
