

//
//  YFToolVC.m
//  day39-project01
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFToolVC.h"
#import "UIImage+GIF.h"
@interface YFToolVC ()

@end

@implementation YFToolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor randColor]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UIImage *img=[UIImage sd_animatedGIFWithData:iData4F(iRes(@"emotion1.gif"))];
    UIImageView *iv=[[UIImageView alloc] initWithFrame:(CGRect){100,100,100,100}];
    [self.view addSubview:iv];
    iv.image=img;
    
}


@end
