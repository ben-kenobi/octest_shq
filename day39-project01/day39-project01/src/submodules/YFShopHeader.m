




//
//  YFShopHeader.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopHeader.h"
#import "YFGoodCell2.h"
#import "YFGoodCell1.h"

@interface YFShopHeader ()
{
    CGFloat h1,h2;
}
//@property (nonatomic,strong)YFGoodCell2 *cell2;
//@property (nonatomic,strong)YFGoodCell1 *cell1;
@property (nonatomic,strong)UILabel *lab;
@end

@implementation YFShopHeader
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        CGFloat cell2h=100,cell1h=36,lineh=8;
        self.cell2=[[YFGoodCell2 alloc] initWithFrame:(CGRect){}];
        [self addSubview:self.cell2];
        self.cell2.frame=CGRectMake(0, 0, iScreenW, cell2h);
     
        self.cell1=[[YFGoodCell1  alloc] initWithFrame:(CGRect){}];

        [self addSubview:self.cell1];
        self.cell1.frame=(CGRect){0,cell2h,iScreenW,cell1h};
        self.backgroundColor=[UIColor whiteColor];
        UIView *line=  [[UIView alloc] init];
        [self addSubview:line];
        [line setBackgroundColor:iGlobalBG];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(@0);
            make.height.equalTo(@(lineh));
        }];
        self.lab=[[UILabel alloc] init];
        [self addSubview:self.lab];
        self.lab.font=iFont(14);
        [self.lab setNumberOfLines:0];
        h1=cell2h+cell1h;
        h2=lineh;
    }
    return self;
}



-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    self.cell2.dict=dict;
    self.cell1.dict=dict;
    CGFloat pad=7;
    NSString *str=self.dict[@"intro"];
    CGSize size=[str boundingRectWithSize:(CGSize){self.w-pad*2,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:iFont(14)} context:0].size;
    self.lab.text=str;
    self.lab.frame=(CGRect){pad,h1+pad,size};
    self.h=pad*2+size.height+h1+h2;
}






@end
