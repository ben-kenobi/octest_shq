


//
//  YFShopFooter.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopFooter.h"

@interface YFShopFooter ()


@end

@implementation YFShopFooter
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor whiteColor]];
        CGFloat pad=8;
        UILabel *lab=[[UILabel alloc] initWithFrame:(CGRect){pad,pad,50,22}];
        lab.text=@"评价";
        [self addSubview:lab];
        self.tv=[[UITextView alloc] initWithFrame:(CGRect){pad,lab.b+5,self.w-pad*2,70}];
        [self addSubview:self.tv];
        [self.tv setBackgroundColor:[UIColor whiteColor]];
        self.tv.layer.cornerRadius=3;
        self.tv.layer.borderColor=[iGlobalBG CGColor];
        self.tv.layer.borderWidth=1;
        [self.tv setFont:iFont(15)];

        self.btn=[IProUtil btnWith:(CGRect){self.w-pad-82,self.tv.b+pad,82,30} title:@"发表评论" bgc:iGlobalBlue font:iFont(13) sup:self];
        self.h=self.btn.b+pad;
        
        UILabel *lab2=[[UILabel alloc] init];
        lab2.textColor=[UIColor lightGrayColor];
        lab2.text=@"选择评分";
        lab2.font=iFont(15);
        [self addSubview:lab2];
        [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.centerY.equalTo(self.btn);
        }];
        self.iv=[[UIImageView alloc] initWithImage:img(@"star_3")];
        [self addSubview:self.iv];
        [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lab2.mas_right).offset(pad);
            make.centerY.equalTo(lab2);
            make.width.equalTo(@(12*5));
            make.height.equalTo(@12);
        }];
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gest:)];
        UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gest:)];
        [self.iv  addGestureRecognizer:tap];
        [self.iv addGestureRecognizer:pan];
        [self.iv setUserInteractionEnabled:YES];
        
    }
    return self;
}

-(void)reset{
    self.iv.image=img(@"star_3");
    self.tv.text=@"";
}
-(void)gest:(UIGestureRecognizer *)gest{
    CGFloat w=gest.view.w;
    CGFloat x=[gest locationInView:gest.view].x;
    CGFloat i=(x/w*5);
    int ind=(int)i;
    CGFloat delta=(i-ind);
    ind=delta>.4?ind+1:ind;
    ind=ind>5?5:ind<0?0:ind;
    self.iv.image=img(iFormatStr(@"star_%d",ind));
    self.iv.tag=ind;
    
    
    
//    if(gest.state==UIGestureRecognizerStateBegan){
//        NSLog(@"123123");
//    }else if(gest.state==UIGestureRecognizerStateChanged){
//        NSLog(@"qqqq");
//    }else if(gest.state==UIGestureRecognizerStateEnded){
//        NSLog(@"eeeee");
//    }
}


@end
