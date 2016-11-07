


//
//  YFModInfoVC.m
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFModInfoVC.h"
#import "YFAlbumV.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface YFModInfoVC ()

@property(nonatomic,strong)UIButton *icon;
@property (nonatomic,strong)UITextField *nickname;
@property (nonatomic,strong)UIButton *mobile;
@property (nonatomic,strong)UIButton *confirm;
@property (nonatomic,strong)UIButton *cancel;
@property (nonatomic,strong)YFAlbumV *album;

@end

@implementation YFModInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navtitle.text=@"资料修改";
    [self.rb removeFromSuperview];
    self.rb=0;
    [self initUI];
}

-(void)initUI{
    CGFloat pad=20,imgw=100;
    self.icon=[[UIButton alloc] initWithFrame:(CGRect){pad,pad+iTopBarH,imgw,imgw}];
    [self.view addSubview:self.icon];
    
    UILabel *lab1=[[UILabel alloc] init];
    lab1.text=@"昵称:";
    [lab1 sizeToFit];
    lab1.cy=self.icon.cy;
    lab1.x=self.icon.r+pad;
    [self.view addSubview:lab1];
    
    self.nickname=[[UITextField alloc] initWithFrame:(CGRect){lab1.r+5,0,self.view.w-(lab1.r+5)-pad,40}];
    self.nickname.cy=self.icon.cy;
    self.nickname.backgroundColor=iColor(80, 182, 250, 1);
    self.nickname.textColor=iColor(240, 240, 240, 1);
    self.nickname.layer.cornerRadius=3;
    [self.view addSubview:self.nickname];

    
   UIView *line1=[[UIView alloc] initWithFrame:(CGRect){0,self.icon.b+50,self.view.w,1}];
    line1.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line1];
    
    self.mobile=[[UIButton alloc] initWithFrame:(CGRect){0,line1.b,self.view.w,65}];
    [self.view addSubview:self.mobile];
    [self.mobile setTitle:@"绑定手机:" forState:0];
    [self.mobile setContentHorizontalAlignment:1];
    [self.mobile setImage:img(@"us_next") forState:0];
    [self.mobile setContentEdgeInsets:(UIEdgeInsets){0,30,0,0}];
    [self.mobile setImageEdgeInsets:(UIEdgeInsets){0,self.mobile.w-50-30,0,0}];
    [self.mobile setTitleColor:[UIColor blackColor] forState:0];
    
    UIView *line2=[[UIView alloc] initWithFrame:(CGRect){0,self.mobile.b,self.view.w,1}];
    line2.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line2];
    
    pad=20;
    CGFloat bw=(self.view.w-pad*4)*.5,bh=36;
    self.confirm=[IProUtil btnWith:(CGRect){pad,line2.b+pad*2,bw,bh} title:@"确认修改" bgc:iColor(80,182,250,1) font:iFont(18) sup:self.view];
    self.cancel=[IProUtil btnWith:(CGRect){pad*3+bw,line2.b+pad*2,bw,bh} title:@"取消" bgc:iColor(80,182,250,1) font:iFont(18) sup:self.view];
    [self.confirm addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
     [self.cancel addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    

    [self.icon setImage:[YFUserInfo shared].usericon forState:0];
    [self.icon addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.nickname.text=[[YFUserInfo shared] getByKey:@"nick_name"];
    [self.mobile setTitle:iFormatStr(@"绑定手机：%@", [[YFUserInfo shared] getByKey:@"mobile"]) forState:0];
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.confirm){
        NSString *mobi=[[self.mobile titleForState:0] substringFromIndex:5];
        NSTextCheckingResult *res=[[IProUtil mobileRe] firstMatchInString:mobi options:NSMatchingReportCompletion range:(NSRange){0,mobi.length}];
        if(res){
            [[YFUserInfo shared] set:[mobi substringWithRange:res.range] forK:@"mobile"];
             [[YFUserInfo shared] set:self.nickname.text forK:@"nick_name"];
            [[YFUserInfo shared] setUsericon:[self.icon imageForState:0]];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [self showToast:@"请输入真实手机号"];
        }
        
        
    }else if(sender==self.cancel){
        [self.navigationController popViewControllerAnimated:YES];
    }else if(sender==self.icon){
        [self album];
        
    }
}


-(YFAlbumV *)album{
    if(!_album){
        _album=[[YFAlbumV alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_album];
        _album.alpha=0;
        __weak typeof (self)ws=self;
        [_album setOnSel:^(UIImage *img) {
            [ws.icon setImage:img forState:0];
            [ws album];
        }];
    }
    [UIView animateWithDuration:.3 animations:^{
        _album.alpha=!_album.alpha;
    }];
    
    
    return _album;
}

@end
