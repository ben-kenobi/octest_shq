
//
//  YFPromptV.m
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFPromptV.h"

@interface YFPromptV ()

@end

@implementation YFPromptV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.backgroundColor=iColor(0, 0, 0, .5);
        self.mainbg=[[UIView alloc] initWithFrame:(CGRect){32,self.h*.5-80,self.w-64,150}];
        [self addSubview:self.mainbg];
        self.mainbg.backgroundColor=iColor(217, 248, 249, 1);
        self.mainbg.layer.cornerRadius=5;
        
        self.title=[[UILabel alloc] initWithFrame:(CGRect){0,0,self.mainbg.w,self.mainbg.h*.5}];
        self.title.textColor=iColor(100, 100, 100, 1);
        self.title.font=iFont(20);
        self.title.textAlignment=NSTextAlignmentCenter;
        [self.mainbg addSubview:self.title];

        
        CGFloat btnw=self.mainbg.w*.4,btnh=45,pad=self.mainbg.w*.2/3;
        self.ok=[IProUtil btnWith:(CGRect){pad,self.mainbg.h*.5,btnw,btnh} title:@"OK" bgc:iColor(60, 168, 245, 1) font:iFont(16) sup:self.mainbg];
        [self.ok addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.cancel=[IProUtil btnWith:(CGRect){2*pad+btnw,self.mainbg.h*.5,btnw,btnh} title:@"Cancel" bgc:iColor(60, 168, 245, 1) font:iFont(16) sup:self.mainbg];
        
        [self.cancel addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.img=[[UIImageView alloc] init];
        [self addSubview:self.img];
        [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.bottom.equalTo(self.mainbg.mas_top).offset(-20);
            make.height.width.equalTo(@110);
        }];
        
    }
    return self;
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.ok){
        if(self.onOK)
            self.onOK(self);
    }else if(sender==self.cancel){
        if(self.onCancel)
            self.onCancel(self);
    }
    [self hide];
}

+(void)showToView:(UIView *)view  cus:(void (^)(YFPromptV *v))cusB  {
    YFPromptV *v=[[self alloc] initWithFrame:view.bounds];
    if(cusB)
        cusB(v);
    [view addSubview:v];
    v.alpha=0;
    [UIView animateWithDuration:.3 animations:^{
        v.alpha=1;
    }];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self hide];
//    NSLog(@"%@",self.ok);
}
-(void)hide{
    [UIView animateWithDuration:.3 animations:^{
        self.alpha=0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
