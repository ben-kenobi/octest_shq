
//
//  YFHomeCell3.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeCell3.h"
#import "DSHomeModel.h"

@interface YFHomeCell3 ()
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *intro;
@property (nonatomic,strong)UILabel *price;

@end

@implementation YFHomeCell3

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        CGFloat pad=8;
        self.icon=[[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@(pad));
            make.bottom.equalTo(@(-pad));
            make.width.equalTo(self.icon.mas_height);
        }];
        
        self.title=[[UILabel alloc] init];
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).offset(pad);
            make.top.equalTo(@(pad));
            make.height.equalTo(@28);
        }];
        
        self.intro=[[UILabel alloc] init];
        self.intro.font=iFont(13);
        [self.contentView addSubview:self.intro];
        [self.intro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title);
            make.top.equalTo(self.title.mas_bottom);
            make.right.equalTo(@(-pad));
        }];
        
        self.price=[[UILabel alloc] init];
        self.price.textColor=[UIColor colorWithRed:0.953 green:0.580 blue:1.000 alpha:1.000];
        self.price.font=iFont(15);
        [self.contentView addSubview:self.price];
        [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-pad));
            make.bottom.equalTo(@-5);
        }];
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


-(void)setM:(DSGuessModel *)m{
    _m=m;
    self.title.text=m.title;
    self.intro.text=m.intro;
    self.icon.image=img(@"guide_2");
    self.price.text=iFormatStr(@"人均¥%@元",m.price);
}

@end
