

//
//  YFGoodCell1.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFGoodCell1.h"

@interface YFGoodCell1 ()

@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UIButton *location;
@property (nonatomic,strong)UIButton *phone;

@end


@implementation YFGoodCell1

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
        UIView *line=  [[UIView alloc] init];
        line.backgroundColor=iColor(220, 220, 220, 1) ;
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(@0);
            make.height.equalTo(@1);
        }];
    }
    return self;
}

-(void)initUI{
   
    self.location=[IProUtil btnWith:(CGRect){0,0,0,0} title:@"" bgc:[UIColor clearColor] font:iFont(13) sup:self.contentView];
    self.location.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, -5);
    self.phone=[IProUtil btnWith:(CGRect){0,0,0,0} title:@"" bgc:[UIColor clearColor] font:iFont(13) sup:self.contentView];
    [self.location setTitleColor:[UIColor orangeColor] forState:0];
    [self.location setImage:img(@"shop_local") forState:0];
    [self.phone setTitleColor:iColor(249, 139, 72, 1) forState:0];
    [self.phone setImage:img(@"shop_phone") forState:0];
    CGFloat pad=6;
    
    [self.phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(@(-pad));
        make.height.equalTo(@20);
    }];
    [self.location mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(pad));
        make.bottom.equalTo(@(-pad));
        make.height.equalTo(@20);
        make.right.equalTo(self.phone.mas_left).offset(-10);
    }];
    
    UIView *line=  [[UIView alloc] init];
    line.backgroundColor=iColor(220, 220, 220, 1) ;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@1);
    }];
    
    UIView *line2=[[UIView alloc] init];
    line2.backgroundColor=iColor(220, 220, 220, 1) ;
    [self.contentView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.location);
        make.width.equalTo(@1);
        make.right.equalTo(self.phone.mas_left);
        make.height.equalTo(self.location);
    }];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if((self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])&&reuseIdentifier){
        [self initUI];
        self.name=[[UILabel alloc] init];
        self.name.font=iFont(15);
        CGFloat pad=6;
        [self.contentView addSubview:self.name];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@(pad));
        }];
    }
    return self;
}




-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    self.name.text=dict[@"shop_name"];
    [self.location setTitle:dict[@"address"] forState:0];
    [self.phone setTitle:dict[@"phone"] forState:0];
}
@end
