


//
//  YFCDV1Top.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCDV1Top.h"


@implementation YFCDV1Top

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.area=[[UIButton alloc] initWithFrame:(CGRect){0,0,78,self.h}];
        [self addSubview:self.area];
        [self.area setTitle:@"区 域" forState:0];
        [self.area setTitleColor:[UIColor blackColor] forState:0];
         [self.area setTitleColor:iColor(50, 50, 50, 1) forState:0];
        [self.area setTitleColor:iColor(180, 180, 180, 1) forState:1];
       UIImage *img= [UIImage imageWithCGImage:[img(@"us_next") CGImage] scale:2 orientation:UIImageOrientationRight ];
        UIImage *img2= [UIImage imageWithCGImage:[img(@"us_next") CGImage] scale:2 orientation:UIImageOrientationUp ];
        [self.area setImage:img forState:0];
        [self.area setImage:img2 forState:4];
        [self.area setImage:img2 forState:1];
        [self.area setImageEdgeInsets:(UIEdgeInsets){0,55,0,0}];
        [self.area setTitleEdgeInsets:(UIEdgeInsets){0,-30,0,0}];
        self.area.titleLabel.font=iFont(16);
        
        CGFloat pad=7,bw=55;
        
        self.search=[IProUtil btnWith:(CGRect){self.w-bw-pad,pad,bw,self.h-pad*2} title:@"搜索" bgc:iGlobalBlue font:iFont(14) sup:self];

        self.sb=[[UISearchBar alloc] initWithFrame:(CGRect){self.area.r,pad,self.search.x-self.area.r-pad,self.search.h}];
        [self addSubview:self.sb];
        UIImageView *view=[self.sb.subviews[0] subviews][0];
        view .image=0;
        self.sb.layer.cornerRadius=3;
        self.sb.layer.borderWidth=1.3;
        self.sb.layer.borderColor=[iGlobalBG CGColor];
        self.sb.placeholder=@"输入搜索名称";

    }
    return self;
}


@end
