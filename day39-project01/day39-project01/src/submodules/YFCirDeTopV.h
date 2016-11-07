//
//  YFCirDeTopV.h
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFCirDeTopV : UIView
@property (nonatomic,strong)NSArray *titles;
@property (nonatomic,strong)void(^onChange)(NSInteger idx);
-(void)selectAtIdx:(NSInteger)idx ani:(BOOL)ani;

@end
