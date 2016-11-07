
//
//  YFGoodVC.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFGoodVC.h"
#import "YFGoodTV.h"
@interface YFGoodVC ()
@property (nonatomic,strong)YFGoodTV *tv;
@end

@implementation YFGoodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tv=[[YFGoodTV alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH}];
    [self.view addSubview:self.tv];
    [self loadDatas];
    [self setNavtitleStr:@"商品详情"];
}
-(void)loadDatas{
    if(_shopinfo&&_goodinfo){
        NSMutableDictionary *dict=[NSMutableDictionary dictionary];
        [dict setValuesForKeysWithDictionary:_goodinfo];
        [dict setValuesForKeysWithDictionary:_shopinfo];
        [self.tv setDict:dict];
    }else{
        [self.tv setDict:iRes4dict(@"good_info.plist")];
    }
}


@end
