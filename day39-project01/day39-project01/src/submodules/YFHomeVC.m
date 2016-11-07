//
//  YFHomeVC.m
//  day39-project01
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeVC.h"
#import "AFNetworking.h"
#import "JSONM.h"
#import "YFHomeM.h"
#import "DSHomeModel.h"
#import "YFHomeHV.h"


@interface YFHomeVC ()<CLLocationManagerDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)YFHomeHV *hv;

@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,strong)DSHomeModel *model;

@end

@implementation YFHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}

-(void)initUI{
    self.tv=[[UITableView alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH-iTabBarH}];
    [self.view addSubview:self.tv];
    
    
    self.hv=[[YFHomeHV alloc] initWithFrame:(CGRect){0,0,self.view.w,150}];
    
    [self.tv setTableHeaderView:self.hv];
    [self loadDatas];


}



-(void)loadDatas{

//    NSMutableDictionary *param=[NSMutableDictionary dictionary];
//    [param setValue:@"120.38" forKey:@"lon"];
//    [param setValue:@"36.06" forKey:@"lat"];
//    [param setValue:[IUtil getTimestamp] forKey:@"time"];
//    [param setValue:[IProUtil digestAry:@[DSAPPID,param[@"lon"],param[@"lat"],param[@"time"],DSIDENTIFIER]] forKey:@"sign"];
//    [param setValue:DSAPPID forKey:@"app_id"];
//    
//    [NetUtil get:@"?anu=api/1/index/get_index_info" param:param callBack:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSString *str=     [[NSString alloc] initWithData:data encoding:4];
//        NSLog(@"%@",str);
//
//    }];
    NSDictionary *dict=iRes4dict(@"home.plist");
    
    self.model=[[DSHomeModel alloc] initWithDictionary:dict error:0];
    
    [self.hv appendDatas:self.model.focus.list ];


}

-(void)location{
    [IProUtil locationWith:^(BOOL suc, NSArray *locs) {
        NSLog(@"%@",locs);
    }];
}














-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self location];
//    
//    [self loadDatas];
//    [self jsonModelTest];
    
}


-(void)jsonModelTest{
//       NSString *str= @"{    \"focus\": {    \"list\": [    {        \"id\": \"焦点图ID\",        \"title\": \"焦点图标题\",   \"cover\":  \"图片链接\",        \"link\": \"所要跳转的基础连接（例如：http://www.qd-life.com/）\",        \"res_name\":  \"跳转到指定的模块\",        \"res_id\": \"指定模块下的详情ID\"    }    ]}}";
//    id obj=[NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:4] options:0 error:0] ;
//    NSLog(@"%@",obj);
    
    NSDictionary *dict=iRes4dict(@"home.plist");
//    NSLog(@"%@",dict);

    DSHomeModel *m=[[DSHomeModel alloc] initWithDictionary:dict error:0];
    NSLog(@"%@",m);
}


@end
