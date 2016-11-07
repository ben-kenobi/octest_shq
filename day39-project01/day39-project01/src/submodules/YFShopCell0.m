//
//  YFShopCell0.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopCell0.h"
#import "YFGoodVC.h"
@interface YFShopCell0 ()
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *detail;
@property (nonatomic,strong)UILabel *price;
@property (nonatomic,strong)UIButton *btn;

@end


@implementation YFShopCell0

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UILabel *(^newl)(UIFont *,UIColor *)=^(UIFont *font,UIColor *color){
            UILabel *l=[[UILabel alloc] init];
            l.font=font;
            l.textColor=color;
            [self.contentView addSubview:l];
            return l;
        };
        self.title=newl(iFont(18),iColor(50, 50, 50, 1));
        self.detail=newl(iFont(14),iColor(120, 120, 120, 1));
        self.price=newl(iFont(15),[UIColor orangeColor]);
        self.detail.numberOfLines=0;
        
        self.btn =[IProUtil btnWith:(CGRect){0,0,0,0} title:@"查看详情" bgc:iGlobalBlue font:iFont(14) sup:self.contentView];
        
        
        UIView *line=     [[UIView alloc] init];
        line.backgroundColor=iGlobalBG;
        [self.contentView addSubview:line];
        
        CGFloat pad=7,btnw=82,btnh=30;
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@(pad));
            make.height.equalTo(@22);
        }];
        
        [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.top.equalTo(self.title.mas_bottom).offset(3);
            make.right.equalTo(self.contentView.mas_right).offset(-btnw-pad*4);

        }];
        
        [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(pad));
            make.top.equalTo(self.detail.mas_bottom).offset(3);
            make.height.equalTo(@20);
            make.bottom.equalTo(@(-pad));
        }];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.right.equalTo(@(-pad*2));
            make.width.equalTo(@(btnw));
            make.height.equalTo(@(btnh));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(@0);
            make.height.equalTo(@1);
        }];
        [self.btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.btn){
        if(self.checkDetail)
            self.checkDetail(self.dict);
    }
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    self.title.text=dict[@"title"];
    self.detail.text=dict[@"intro"];
    self.price.text=[@"¥" stringByAppendingString:dict[@"price"]];
}
@end
