//
//  YFUserHeader.m
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFUserHeader.h"

@implementation YFUserHeader


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setBackgroundColor:iGlobalBG];
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIView *bg=[[UIView alloc] initWithFrame:(CGRect){0,0,self.w,self.h-6}];
    [bg setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:bg];
    
    CGFloat pad=20,imgh=bg.h-pad*2;
    self.icon=[[UIButton alloc] initWithFrame:(CGRect){pad,pad,imgh,imgh}];
    [bg addSubview:self.icon];
    self.icon.layer.cornerRadius=imgh*.5;
    self.icon.layer.masksToBounds=YES;
    
    self.name=[[UILabel alloc] initWithFrame:(CGRect){self.icon.r+pad,pad,150,imgh*.5}];
    [bg addSubview:self.name];
    self.name.font=iFont(23);
    
    self.myorder=[IProUtil btnWith:(CGRect){self.name.x,self.name.b,120,38} title:@"我的订单" bgc:iColor(47, 159, 244, 1) font:iFont(18) sup:bg];

}

@end
