//
//  YFLoginVC.m
//  day39-project01
//
//  Created by apple on 15/11/22.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFLoginVC.h"
#import "YFLoginTF.h"
#import "YFThirdLogin.h"
#import "MD5.h"
#import "UMSocial.h"

@interface YFLoginVC ()<UITextFieldDelegate>
@property (nonatomic,strong)YFLoginTF *username;
@property (nonatomic,strong)YFLoginTF *pwd;
@property (nonatomic,strong)UIButton *rempwd;
@property (nonatomic,strong)UIButton *forgot;
@property (nonatomic,strong)UIButton *login;
@property (nonatomic,strong)UIButton *regi;
@property (nonatomic,strong)YFThirdLogin *third;

@end

@implementation YFLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navtitle.text=@"Login";
    self.rb.hidden=YES;
    [self initUI];
    
}

-(void)initUI{
    CGFloat hpad=25;
    self.username=[YFLoginTF tfWithFrame:(CGRect){hpad,40+iTopBarH,self.view.w-50,36} img:img(@"nav_user") ph:@"邮箱或手机号码"];
    [self.view addSubview:self.username];
    self.pwd=[YFLoginTF tfWithFrame:(CGRect){hpad,40+36+15+iTopBarH,self.view.w-50,36} img:img(@"user_passwd") ph:@"6-12 仅数字与字母"];
    [self.view addSubview:self.pwd];
    
    UIButton *(^newb)(NSMutableAttributedString*,CGRect)=^(NSMutableAttributedString *title,CGRect frame){
        UIButton *b=[[UIButton alloc] initWithFrame:frame];
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:b];
        [b setAttributedTitle:title forState:UIControlStateNormal];

        NSMutableAttributedString *hstr=[[NSMutableAttributedString alloc] initWithString:title.string attributes:[title attributesAtIndex:0 effectiveRange:0]];
        [hstr removeAttribute:NSForegroundColorAttributeName range:(NSRange){0,title.length}];
        [ hstr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:(NSRange){0,title.length}];
       
        [b setAttributedTitle:hstr forState:UIControlStateHighlighted];
        [b setAttributedTitle:hstr forState:UIControlStateDisabled];
        return b;
    };
    
    self.rempwd=newb([[NSMutableAttributedString alloc] initWithString:@"记住密码" attributes:@{NSFontAttributeName:iFont(13),NSForegroundColorAttributeName:iColor(115, 200, 253, 1)}],(CGRect){hpad,self.pwd.b+5,80,20});
    [self.rempwd setImage:img(@"btn_normal") forState:UIControlStateNormal];
    [self.rempwd setImage:img(@"btn_selected") forState:UIControlStateSelected];
    [self.rempwd setTitleEdgeInsets:(UIEdgeInsets){0,5,0,0}];
    
    CGSize forgotsize=[@"忘记密码?" boundingRectWithSize:(CGSize){CGFLOAT_MAX,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:iFont(13)} context:0].size ;
    self.forgot=newb([[NSMutableAttributedString alloc]initWithString:@"忘记密码?" attributes:@{NSFontAttributeName:iFont(13),NSForegroundColorAttributeName:iColor(115, 200, 253, 1),NSUnderlineStyleAttributeName:@1}],(CGRect){self.view.w-hpad-forgotsize.width,self.pwd.b+5,forgotsize.width,20});
    
    
    self.login=newb([[NSMutableAttributedString alloc] initWithString:@"登录" attributes:@{NSFontAttributeName:iBFont(20),NSForegroundColorAttributeName:iColor(255, 255, 255, 1)}],(CGRect){hpad,self.pwd.b+50,self.pwd.w,self.pwd.h});
    [self.login setBackgroundColor:iGlobalBlue];
    self.login.layer.cornerRadius=3;
    self.login.layer.masksToBounds=YES;
    
    self.regi=newb([[NSMutableAttributedString alloc] initWithString:@"还没有账号？立即注册" attributes:@{NSFontAttributeName:iBFont(16),NSForegroundColorAttributeName:iColor(250, 141, 176, 1)}],(CGRect){hpad,self.login.b+40,self.pwd.w,self.pwd.h});
    
    
    self.third=[[YFThirdLogin alloc] initWithFrame:(CGRect){0,self.regi.b+30,self.view.w,self.view.h-self.regi.b}];
    [self.view addSubview:self.third];
    [self.third setBackgroundColor:[UIColor clearColor]];
    [self.third setDatas:@[@{@"icon":@"login_qq",@"name":@"QQ"},
  @{@"icon":@"login_wb",@"name":@"微博"},
  @{@"icon":@"login_wx",@"name":@"微信"},
  @{@"icon":@"login_db",@"name":@"豆瓣"}]];
    __weak typeof(self) ws=self;
    [self.third setOnclick:^(NSDictionary *dict) {
        if([dict[@"name"] isEqualToString:@"微博"]){
            UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
            snsPlatform.loginClickHandler(ws,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
                if (response.responseCode == UMSResponseCodeSuccess) {
                    
                    UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
                    [ws showToast:iFormatStr( @"username=%@",snsAccount.userName)];
                    NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
                }else{
                    NSLog(@"%@",response);
                   [ws showToast:response.message];
                }
            });
        }

    }];
    
    [self updateUI];
    self.rempwd.selected=[iPref(0) boolForKey:@"rempwd"];
    [self.pwd setSecureTextEntry:YES];
    
    [iNotiCenter addObserver:self selector:@selector(onTfChange:) name:UITextFieldTextDidChangeNotification object:self.username];
    [iNotiCenter addObserver:self selector:@selector(onTfChange:) name:UITextFieldTextDidChangeNotification object:self.pwd];
    

    
    self.username.text=[[YFUserInfo shared] getByKey:@"mobile"];
    if(self.rempwd.selected)
        self.pwd.text=[[YFUserInfo shared] getByKey:@"user_id"];
    [self updateUI];

    
}




-(void)getUserInfo{
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        NSLog(@"sinaUserInfo: %@",response.data);
    }];
}

-(void)onTfChange:(NSNotification *)noti{
    [self updateUI];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.username becomeFirstResponder];
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.rempwd){
        sender.selected=!sender.selected;
        [iPref(0) setBool:sender.selected forKey:@"rempwd"];
        [iPref(0) synchronize];
    }else if(sender==self.forgot){
        
    }else if(sender==self.login){
        NSString *name=_username.text;
        NSString *pwd=_pwd.text;
        [self showLoadVWithMes:@"login..."];
        dispatch_after(dispatch_time(0, 1e9), dispatch_get_main_queue(), ^{
            [self dismLoadV];
            if([self login:name pwd:pwd]){
                if(self.rempwd.selected){
                    
                }
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [self showToast:@"用户名或密码错误"];
            }
        });
      
    }else if(sender==self.regi){
        
    }
}

-(void)updateUI{
    NSString *name=_username.text;
    NSString *pwd=_pwd.text;
    self.login.enabled=([[IProUtil usernameRe] firstMatchInString:name options:NSMatchingReportCompletion range:(NSRange){0,name.length}]&&[[IProUtil pwdRe] firstMatchInString:pwd options:NSMatchingReportCompletion range:(NSRange){0,pwd.length}]);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}





@end
