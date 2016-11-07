//
//  YFCDV1CellTableViewCell.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCDV1Cell.h"
#import "UIImageView+WebCache.h"
@interface YFCDV1Cell ()
@property (nonatomic,strong)UIImageView *img;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UIImageView *score;
@property (nonatomic,strong)UILabel *detail;
@property (nonatomic,strong)UIButton *dist;
@end


@implementation YFCDV1Cell
-(void)initUI{
    self.img=[[UIImageView alloc] init];
    [self.contentView addSubview:self.img];
    self.name=[[UILabel alloc] init];
    [self.contentView addSubview:self.name];
    self.name.font=iFont(15);
    self.score=[[UIImageView alloc] init];
    [self.contentView addSubview:self.score];
//    self.name.font=[UIFont fontWithName:[UIFont fontNamesForFamilyName:@"Menlo"][0] size:15];

    self.detail=[[UILabel alloc] init];
    [self.contentView addSubview:self.detail];
    self.detail.font=iFont(12);
    self.detail.numberOfLines=0;
    
    CGFloat pad=7;
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(pad));
        make.bottom.equalTo(@(-pad));
        make.width.equalTo(self.img.mas_height).multipliedBy(1.3);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(pad));
        make.left.equalTo(self.img.mas_right).offset(pad);
        make.height.equalTo(@20);
        make.right.equalTo(@(-pad));
    }];
    
    [self.score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.img);
        make.left.equalTo(self.name);
        make.height.equalTo(@11);
        make.width.equalTo(@55);
    }];
    
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.bottom.equalTo(self.score.mas_top);
        make.top.equalTo(self.name.mas_bottom);
        make.right.equalTo(@-10);
    }];
    
    
 
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if((self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])&&reuseIdentifier){
        [self initUI];
        self.dist=[[UIButton alloc] init];
        [self.dist setTitleColor:[UIColor orangeColor] forState:0];
        self.dist.titleLabel.font=iFont(10);
        [self.contentView addSubview:self.dist];
        [self.dist setImage:img(@"shop_local") forState:0];
        
        [self.dist mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(@(-7));
        }];
        
    }
    return self;
}


-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
//    [self.img sd_setImageWithURL:iURL(dict[@"cover"])];
    
        [self.img sd_setImageWithURL:iFURL(iRes(@"goods.png"))];
//    self.img.image = imgFromF(iRes(@"goods.png"));
    self.name.attributedText=[[NSAttributedString alloc] initWithString:dict[@"shop_name"] attributes:@{NSFontAttributeName:[UIFont fontWithName:[UIFont fontNamesForFamilyName:@"Menlo"][1] size:15]}]  ;
    self.detail.text=dict[@"intro"];
    self.score.image=img(iFormatStr(@"star_%@",dict[@"score"]));
    [self.dist setTitle:iFormatStr(@"距离%dm",1000) forState:0];
}

@end
