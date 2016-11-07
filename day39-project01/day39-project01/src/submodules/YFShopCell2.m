


//
//  YFShopCell2.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopCell2.h"
#import "UIImageView+WebCache.h"

@interface YFShopCell2 ()
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UIImageView *score;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *date;
@property (nonatomic,strong)UILabel *content;


@end


@implementation YFShopCell2

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UILabel *(^newl)(UIFont *,UIColor *)=^(UIFont *font,UIColor *color){
            UILabel *l=[[UILabel alloc] init];
            l.font=font;
            l.textColor=color;
            [self.contentView addSubview:l];
            return l;
        };
        self.name=newl(iFont(16),iColor(50, 50, 50, 1));
        self.date=newl(iFont(14),iColor(150, 150, 150, 1));
        self.content=newl(iFont(16),iColor(100, 100, 100, 1));
        self.content.numberOfLines=0;
        
        CGFloat pad=7,imgw=24;
        self.icon=[[UIImageView alloc] init];
        self.icon.layer.cornerRadius=12;
        self.icon.layer.masksToBounds=YES;
        self.icon.layer.borderColor=[iGlobalGreen CGColor];
        self.icon.layer.borderWidth=.5;
        [self.contentView addSubview:self.icon];
        self.score=[[UIImageView alloc] initWithImage:img(@"star_2")];
        [self.contentView addSubview:self.score];
        
        
        
        UIView *line=     [[UIView alloc] init];
        line.backgroundColor=iGlobalBG;
        [self.contentView addSubview:line];
        
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.icon);
            make.left.equalTo(self.icon.mas_right).offset(5);
        }];
        [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.icon);
            make.centerX.equalTo(@0);
        }];
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@(pad));
            make.height.width.equalTo(@(imgw));
        }];
        
        [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-40);
            make.centerY.equalTo(self.icon);
        }];
        
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.right.equalTo(@(-pad));
            make.top.equalTo(self.icon.mas_bottom);
            make.bottom.equalTo(@(-pad));
        }];
        
        
      
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(@0);
            make.height.equalTo(@1);
        }];
    }
    return self;
}



-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    self.name.text=dict[@"name"];
    self.content.text=dict[@"comment"];
    self.date.text=dict[@"time"];
    self.score.image=img(iFormatStr(@"star_%@",dict[@"score"]));
    if(dict[@"img"]){
        [self.icon setImage:dict[@"img"]];
    }else
        [self.icon setImage:img(@"home_error")];
}
@end
