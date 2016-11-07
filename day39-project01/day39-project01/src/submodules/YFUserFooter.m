//
//  YFUserFooter.m
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFUserFooter.h"

@implementation YFUserFooter

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIButton *(^newb)(NSString *,CGRect,UIImage *,UIColor *)=^(NSString *title,CGRect frame,UIImage *img,UIColor *color){
        UIButton *b=[IProUtil btnWith:frame title:title bgc:color font:iFont(16) sup:self];
        [b setImage:img forState:0];
        return b;
    };
    
    CGFloat pad=30,btnw=(self.w-pad*2.5)*.5,btnh=45;
    self.modiInfo=newb(@"修改资料",(CGRect){pad,pad,btnw,btnh},img(@"user_info"),iColor(49, 164, 182, 1));
     self.modipwd=newb(@"修改密码",(CGRect){self.modiInfo.r+pad*.5,pad,btnw,btnh},img(@"user_passwd"),iColor(49, 164, 182, 1));
     self.logout=newb(@"退出登录",(CGRect){pad,self.modiInfo.b+pad,self.w-pad*2,btnh},0,iColor(196, 81, 47, 1));
}

@end
