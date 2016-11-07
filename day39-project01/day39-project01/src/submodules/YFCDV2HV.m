
//
//  YFCDV2HV.m
//  day39-project01
//
//  Created by apple on 15/11/30.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCDV2HV.h"
#import "UIImageView+WebCache.h"

@interface YFCDV2HV ()<UITextViewDelegate>
@property (nonatomic,strong)UIImageView *iv;
@property (nonatomic,strong)UILabel *topic;
@property (nonatomic,strong)UILabel *time;
@property (nonatomic,strong)UILabel *detail;
@property (nonatomic,strong)UILabel *phlab;
@property (nonatomic,strong)UITextView *tv;

@end
@implementation YFCDV2HV


- (void)textViewDidChange:(UITextView *)textView{
    [self.dict  setValue:textView.text forKeyPath:@"comment"];
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    //    [self.iv sd_setImageWithURL:iURL(dict[@"cover"])];
        [self.iv sd_setImageWithURL:iFURL(iRes(@"goods.png"))];
    self.topic.text=dict[@"title"];
    self.detail.text=dict[@"detail"];
    self.time.text=dict[@"time"];
    self.phlab.hidden=[YFUserInfo shared].islogin;
    self.tv.text=dict[@"comment"];
}





-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithReuseIdentifier:reuseIdentifier]){
        self.contentView.backgroundColor=[UIColor whiteColor];
        UIView *bg=    [[UIView alloc] init];
        [self.contentView addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@0);
            make.height.width.equalTo(self.contentView);
        }];
        CGFloat pad=7,imgh=140;
        self.iv=[[UIImageView alloc] init];
        [bg addSubview:self.iv];
        [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(@0);
            make.height.equalTo(@(imgh));
        }];
        
        UILabel *(^newl)(UIFont *,UIColor *,NSInteger)=^(UIFont *font,UIColor *color,NSInteger line){
            UILabel *lab=[[UILabel alloc] init];
            [lab setNumberOfLines:line];
            [lab setFont:font];
            [lab setTextColor:color];
            [bg addSubview:lab];
            return lab;
        };
        
        self.topic=newl(iFont(16),iColor(50, 50, 50, 1),1);
        self.time=newl(iFont(12),iColor(150, 150, 150, 1),1);
        self.detail=newl(iFont(14),iColor(80, 80, 80, 1),0);
        [self.topic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iv.mas_bottom).offset(pad);
            make.left.equalTo(@(pad));
            make.height.equalTo(@18);
            make.right.equalTo(@-80);
        }];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-pad));
            make.centerY.equalTo(self.topic);
        }];
        
        [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.top.equalTo(self.topic.mas_bottom).offset(pad);
            make.right.equalTo(@(-pad));
//            make.bottom.equalTo(@(-pad));
        }];
        
        
        
        UIView *line =[[UIView alloc] init];
        [bg addSubview:line];
        [line setBackgroundColor:iGlobalBG];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.height.equalTo(@1);
            make.top.equalTo(self.detail.mas_bottom).offset(pad);
        }];
        
        UILabel *lab= newl(iFont(16),iColor(50, 50, 50, 1),1);
        lab.text=@"评价";
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).offset(pad);
            make.left.equalTo(@(pad));
            make.height.equalTo(@20);
        }];
        self.tv=[[UITextView alloc] init];
        [bg addSubview:self.tv];
        [self.tv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.right.equalTo(@(-pad));
            make.top.equalTo(lab.mas_bottom).offset(pad);
            make.height.equalTo(@65);
        }];
        self.tv.layer.cornerRadius=2;
        self.tv.layer.borderColor=[iGlobalBG
        CGColor];
        self.tv.layer.borderWidth=1;
        
        self.btn = [IProUtil btnWith:(CGRect){} title:@"发表评论" bgc:iGlobalBlue font:iFont(14) sup:bg];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tv.mas_bottom).offset(pad);
            make.right.equalTo(@(-pad));
            make.bottom.equalTo(@(-pad));
            make.height.equalTo(@26);
            make.width.equalTo(@75);
        }];
        
        self.phlab=[[UILabel alloc] init];
        self.phlab.text=@"请登录后再评价";
        self.phlab.textColor=iColor(200, 200, 200, 1);
        self.phlab.font=iFont(13);
        [self.tv addSubview:self.phlab];
        [self.phlab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@(pad));
        }];
        self.tv.delegate=self;
    }
    
        return self;
}


@end
