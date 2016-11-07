//
//  YFBasNavVC.h
//  day39-project01
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFBasVC.h"

@interface YFBasNavVC : YFBasVC
@property (nonatomic,copy)NSString *navtitleStr;
@property (nonatomic,weak)UILabel *navtitle;
@property (nonatomic,weak)UIButton *lb;
@property (nonatomic,weak)UIButton *rb;
@property (nonatomic,weak)UIView *topnav;



-(void)onLbClicked:(UIButton *)sender;
-(void)onRbClicked:(UIButton *)sender;

-(BOOL)login:(NSString *)username pwd:(NSString *)pwd;
-(void)logout;

@end
