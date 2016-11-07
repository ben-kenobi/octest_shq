
//
//  YFShopVC.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopVC.h"
#import "YFShopTv.h"
#import "YFShopHeader.h"
#import "YFShopFooter.h"

@interface YFShopVC ()
@property (nonatomic,strong)YFShopTv *tv;
@property (nonatomic,strong)YFShopHeader *header;
@property (nonatomic,strong)YFShopFooter *footer;
@end

@implementation YFShopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tv=[[YFShopTv alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH}];
    [self.view addSubview:self.tv];
    
    self.header=[[YFShopHeader alloc] initWithFrame:(CGRect){0,0,self.view.w,200}];
    [self.tv setTableHeaderView:self.header];
    self.footer=[[YFShopFooter alloc] initWithFrame:(CGRect){0,0,self.view.w,200}];
    [self.tv setTableFooterView:self.footer];
    __weak typeof(self)ws=self;
    [self.tv setLoadMore:^(NSInteger section) {
        if(section==0){
            [ws.tv appendGoods:[ws.tv.goods subarrayWithRange:(NSRange){0,2}]];
        }else if(section==1){
            [ws.tv appendComments:[ws.tv.comments subarrayWithRange:(NSRange){0,2}]];
        }
    }];
    
    [self.footer.btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setNavtitleStr:@"商家详情"];
    
    [self loadDatas];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)onBtnClicked:(UIButton *)sender{
    NSString *text=self.footer.tv.text;
    if(text.length<10){
        [self showToast:@"字数必须大于10"];
    }else{
        NSString *score=iFormatStr(@"%ld", self.footer.iv.tag);
        [self.tv.comments insertObject:@{@"name":[[YFUserInfo shared] getByKey:@"nick_name"],
        @"time":[[NSDate date] dateFormat],
        @"comment":text,
        @"score":score,@"img": [[YFUserInfo shared] usericon]                                } atIndex:0];
        [self.tv reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:0];
        [self.tv scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:0 animated:YES];
        [self.footer reset];
    }
}


-(void)loadDatas{
   NSDictionary *dict=iRes4dict(@"shop_info.plist");
    [self.tv setDict:dict];
    [self.header setDict:dict];
}












-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSString *rule=@"(^[_a-zA-Z0-9.%+-]+@([_a-z A-Z 0-9]+\\.)+[a-z A-Z 0-9]{2,6}$)|(^0{0,1}(13[0-9]|15[7-9]|153|156|18[0-9])[0-9]{8}$)";
   
    
    NSArray *ary=iRes4dict(@"cirde.plist")[@"guess"];

    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id>=5 and shop_name contains '蛋糕' and server='美食' and address matches '青岛市黄岛区崇明岛路41号' and score=='4' "];
    
    
    NSArray *contain = [ary filteredArrayUsingPredicate:predicate];
    
    
    NSLog(@"%@",contain);


}








@end
