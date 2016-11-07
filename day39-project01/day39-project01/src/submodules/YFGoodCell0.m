

//
//  YFGoodCell0.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFGoodCell0.h"

@interface YFGoodCell0 ()
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *detail;
@property (nonatomic,strong)UILabel *cost;
@property (nonatomic,strong)UIButton *share;
@property (nonatomic,strong)UIButton *buy;


@end

@implementation YFGoodCell0

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        CGFloat pad=6;
        UILabel *(^newl)(UIFont *,UIColor *,NSInteger)=^(UIFont *font,UIColor *color,NSInteger line){
            UILabel *l=[[UILabel alloc] init];
            l.textColor=color;
            l.font=font;
            l.numberOfLines=line;
            [self.contentView addSubview:l];
            return l;
        };
        self.title=newl(iFont(17),iColor(60, 60, 60, 1),1);
        self.detail=newl(iFont(14),iColor(100, 100, 100, 1),0);
        self.cost=newl(iFont(15),iColor(249, 139, 72, 1),1);
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@(pad));
            make.height.equalTo(@20);
        }];
        [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.top.equalTo(self.title.mas_bottom);
            make.right.equalTo(@(-pad));
        }];

        [self.cost mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.bottom.equalTo(@(-pad));
            make.height.equalTo(@30);
            make.top.equalTo(self.detail.mas_bottom).offset(pad);
        }];
        self.share=[IProUtil btnWith:(CGRect){0,0,0,0} title:@"分享" bgc:iGlobalBlue font:iFont(15) sup:self.contentView];
        self.buy=[IProUtil btnWith:(CGRect){0,0,0,0} title:@"立即购买" bgc:iGlobalBlue font:iFont(15) sup:self.contentView];
   
        CGFloat btnh=30;
        [self.buy mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-pad));
            make.bottom.equalTo(@(-pad));
            make.height.equalTo(@(btnh));
            make.width.equalTo(@(90));
        }];
        [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.buy.mas_left).offset(-pad);
            make.bottom.equalTo(@(-pad));
            make.height.equalTo(@(btnh));
            make.width.equalTo(@(65));
        }];
        [self setSelectionStyle:0];
    }
    return self;
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    self.title.text=dict[@"title"];
    self.detail.text=dict[@"intro" ];
    self.cost.text=[@"人均¥ " stringByAppendingString:dict[@"price"] ];
}

@end
