//
//  YFUserCenterVC.m
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFUserCenterVC.h"
#import "YFUserHeader.h"
#import "YFUserFooter.h"
#import "YFUserInfoCell.h"
#import "YFUserFooter.h"
#import "YFUserHeader.h"
#import "YFPromptV.h"
#import "YFModInfoVC.h"
@interface YFUserCenterVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,strong)NSDictionary *datas;
@property (nonatomic,strong)YFUserHeader *header;
@property (nonatomic,strong)YFUserFooter *footer;
@property (nonatomic,strong)UIButton *myrb;
@end

@implementation YFUserCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navtitle.text=@"个人中心";
    [self.view setBackgroundColor:iGlobalBG];

    self.tv=[[UITableView alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH}];
    [self.tv setBackgroundColor:[UIColor whiteColor]];
    self.tv.delegate=self;
    self.tv.dataSource=self;
    self.tv.separatorStyle=0;
    self.tv.rowHeight=44;
    [self.view addSubview:self.tv];
   self.footer= [[YFUserFooter alloc] initWithFrame:(CGRect){0,0,self.tv.w,200}];
    self.tv.tableFooterView=self.footer;
    self.header=[[YFUserHeader alloc] initWithFrame:(CGRect){0,0,self.tv.w,150}];
    self.tv.tableHeaderView=self.header;
    
    
    
    [self.footer.logout addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.footer.modiInfo addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.rb removeFromSuperview];
    self.rb=nil;
    
    CGFloat pad=8,btnw=iNavH-pad*2;
    self.myrb=[[UIButton alloc] initWithFrame:(CGRect){self.view.w-btnw-pad*2,pad+iStBH,btnw,btnw}];
    [self.topnav addSubview:self.myrb];
    self.myrb.layer.cornerRadius=btnw*.5;
    self.myrb.layer.masksToBounds=YES;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFUserInfoCell *cell=[YFUserInfoCell cellWithTv:tableView];
    if(indexPath.row==0){
        cell.textLabel.text=@"性别";
        cell.detailTextLabel.text=([self.datas[@"gender"] intValue]?@"男":@"女");
    }else if(indexPath.row==1){
        cell.textLabel.text=@"手机";
        cell.detailTextLabel.text=self.datas[@"mobile"];
    }
    return cell;
}


-(NSDictionary *)datas{
    if(!_datas){
        _datas=[YFUserInfo shared].dict;
    }
    return _datas;
}

-(void)onBtnClicked:(UIButton *)btn{
    if(btn==self.footer.logout){
        [YFPromptV showToView:self.view cus:^(YFPromptV *v) {
            v.img.image=img(@"home_error");
            v.title.text=@"确认要退出么?";
            [v.ok setTitle:@"确认退出" forState:0];
            [v.cancel setTitle:@"取消" forState:0];
            [v setOnOK:^(YFPromptV *v) {
                [self logout];
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }] ;
    }else if(btn==self.footer.modiInfo){
        [self.navigationController showViewController:[[YFModInfoVC alloc] init] sender:0];
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)updateUI{
    self.header.name.text=self.datas[@"nick_name"];
    [self.tv reloadData];
    
    UIImage *img=[YFUserInfo shared].usericon;
    [self.header.icon setImage:img forState:0];
    [self.myrb setImage:img forState:0];
}




@end
