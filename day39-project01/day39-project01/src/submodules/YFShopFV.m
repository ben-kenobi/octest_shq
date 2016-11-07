


//
//  YFShopFV.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShopFV.h"
@interface YFShopFV ()


@end


@implementation YFShopFV
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithReuseIdentifier:reuseIdentifier]){
        self.btn=[[YFShopBtn alloc] init];
        [self.contentView addSubview:self.btn];
        [self.btn setTitleColor:iGlobalBlue forState:0];
        [self.btn setTitleColor:iColor(230, 230, 230, 1) forState:1];
        [self.btn setImage:img(@"us_next") forState:0];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(@1);
            make.height.equalTo(@34);
        }];
        self.btn.titleLabel.font=iFont(15);
        [self.btn setBackgroundColor:[UIColor whiteColor]];
        
        
    }
    return self;
}


@end


@implementation YFShopBtn
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    self.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.cx=self.icx-10;
    self.imageView.x=self.titleLabel.r+5;
    
}

@end