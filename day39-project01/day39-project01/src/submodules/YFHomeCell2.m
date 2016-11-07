
//
//  YFHomeCell2.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeCell2.h"
#import "YFevaluator.h"
#import "DSHomeModel.h"
@interface YFHomeCell2 ()
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *intro;
@property (nonatomic,strong)YFevaluator *eva;
@property (nonatomic,strong)UIButton *dis;
@property (nonatomic,strong)UIImageView *icon;


@end

@implementation YFHomeCell2


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        CGFloat pad=8,iconw=50;
        self.icon=[[UIImageView alloc] initWithFrame:(CGRect){self.w-iconw-pad,pad,iconw,iconw}];
        [self addSubview:self.icon];
        
        self.title=[[UILabel alloc] init];
        [self.title setFont:iBFont(14)];
        [self addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@(pad));
            make.right.equalTo(self.icon.mas_left);
            make.height.equalTo(@20);
        }];
        
        self.eva=[[YFevaluator alloc] init];
        [self.eva setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.eva];
        self.eva.count=5,self.eva.unit=1;
        [self.eva mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.top.equalTo(self.title.mas_bottom).offset(3);
            make.height.equalTo(@10);
            make.width.equalTo(@60);
        }];
        [self.eva setUserInteractionEnabled:NO];
        
        self.intro=[[UILabel alloc] init];
        [self addSubview:self.intro];
        [self.intro setNumberOfLines:0];
        self.intro.font=iFont(12);
        self.intro.textColor=[UIColor grayColor] ;
        [self.intro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.top.equalTo(self.eva.mas_bottom).offset(5);
            make.right.equalTo(self.icon.mas_left);
            make.bottom.equalTo(@0);
        }];
        
        self.dis=[[UIButton alloc] init];
        [self.dis setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self addSubview:self.dis];
        [self.dis setImage:img(@"home_location") forState:UIControlStateNormal];
        self.dis.titleLabel.font=iFont(9);
        self.dis.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, -6);
        [self.dis mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-8);
            make.bottom.equalTo(@0);
            make.top.equalTo(self.icon.mas_bottom);
        }];
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

-(void)setM:(DSFamousModel *)m{
    _m=m;
    self.title.text=m.name;
    self.intro.text=m.intro;
    [self.dis setTitle:@"距离129米" forState:UIControlStateNormal];
    self.icon.image=img(@"guide_2");
    self.eva.percent=m.score/5.0;
}

@end
