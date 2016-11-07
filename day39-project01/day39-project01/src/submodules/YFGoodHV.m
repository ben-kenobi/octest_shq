
//
//  YFGoodHV.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFGoodHV.h"

@implementation YFGoodHV

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
        if(self=[super initWithReuseIdentifier:reuseIdentifier]){
            UIView *bg=[[UIView alloc] init];
            [self addSubview:bg];
            [bg setBackgroundColor:[UIColor clearColor]];
            [bg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(@0);
                make.bottom.equalTo(@0);
            }];
    
    
            self.lab=[[UILabel alloc] init];
            [_lab setFont:iBFont(16)];
            [bg addSubview:self.lab];
            [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@15);
                make.centerY.equalTo(@0);
            }];
            [self.contentView setBackgroundColor:[UIColor clearColor]];
            _lab.textColor=iColor(218, 96, 114, 1);
        }
        return self;
}

@end
