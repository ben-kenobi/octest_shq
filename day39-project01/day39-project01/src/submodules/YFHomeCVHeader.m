
//
//  YFHomeCVHeader.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeCVHeader.h"

@interface YFHomeCVHeader ()


@end

@implementation YFHomeCVHeader

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UIView *bg=[[UIView alloc] init];
        [self addSubview:bg];
        [bg setBackgroundColor:[UIColor whiteColor]];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(@0);
            make.bottom.equalTo(@-.5);
        }];
        
        
        self.lab=[[UILabel alloc] init];
        [_lab setFont:iBFont(16)];
        [bg addSubview:self.lab];
        [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.centerY.equalTo(@0);
        }];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

@end
