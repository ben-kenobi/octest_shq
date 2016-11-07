
//
//  YFGoodCell2.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFGoodCell2.h"
#import "UIImageView+WebCache.h"
@interface YFGoodCell2 ()
@property (nonatomic,strong)UIImageView *img;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UIButton *score;
@property (nonatomic,strong)UILabel *location;

@end

@implementation YFGoodCell2
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
        self.share=[IProUtil btnWith:(CGRect){} title:@"分享" bgc:iGlobalBlue font:iFont(14) sup:self.contentView];
        [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(@(-9));
            make.height.equalTo(@28 );
            make.width.equalTo(@75);
        }];

    }
    return self;
}

-(void)initUI{
    self.img=[[UIImageView alloc] init];
    [self.contentView addSubview:self.img];
    self.name=[[UILabel alloc] init];
    [self.contentView addSubview:self.name];
    
    self.score=[[UIButton alloc] init];
    [self.contentView addSubview:self.score];
    [self.score setTitleColor:[UIColor orangeColor] forState:0];
    self.score.titleLabel.font=iFont(15);
    self.score.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, -5);
    self.location=[[UILabel alloc] init];
    [self.contentView addSubview:self.location];
    self.location.font=iFont(12);
    self.location.numberOfLines=2;
    
    CGFloat pad=9;
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(pad));
        make.bottom.equalTo(@(-pad));
        make.width.equalTo(self.img.mas_height);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(pad));
        make.left.equalTo(self.img.mas_right).offset(pad);
        make.height.equalTo(@30);
    }];
    
    [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(self.name);
    }];
    
    [self.location mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.bottom.equalTo(@0);
        make.height.equalTo(@40);
        make.right.equalTo(@-100);
    }];

    
    UIView *line=  [[UIView alloc] init];
    line.backgroundColor=iColor(220, 220, 220, 1) ;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@1);
    }];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if((self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])&&reuseIdentifier){
        [self initUI];
        self.dist=[[UIButton alloc] init];
        [self.dist setTitleColor:[UIColor orangeColor] forState:0];
        self.dist.titleLabel.font=iFont(9);
        [self.contentView addSubview:self.dist];
        [self.dist setImage:img(@"shop_local") forState:0];
        
        [self.dist mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(@(-9));
        }];

    }
    return self;
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    float score;
    if(dict){
//        [self.img sd_setImageWithURL:iURL(dict[@"cover"])];
        [self.img sd_setImageWithURL:iFURL(iRes(@"goods.png"))];
        self.name.text=dict[@"shop_name"];
        self.location.text=dict[@"address"];
        score=1.0;
    }else{
        self.img.image=img(@"guide_0");
        self.name.text=@"商品名称";
        self.location.text=@"商家地址";
        score=3.0;
    }

    
    [self.dist setTitle:iFormatStr(@"%dm",1000) forState:0];
    [self.score setImage:img(iFormatStr(@"star_%d",(int)score)) forState:0];
    NSMutableAttributedString *mastr=[[NSMutableAttributedString alloc] initWithString:iFormatStr(@"%.2f",score) attributes:@{NSFontAttributeName:iBFont(13),NSForegroundColorAttributeName:[UIColor orangeColor]}];
    [mastr appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"分" attributes:@{NSFontAttributeName:iFont(10),NSForegroundColorAttributeName:[UIColor orangeColor]}]];
    [self.score setAttributedTitle:mastr forState:0];
}
@end
