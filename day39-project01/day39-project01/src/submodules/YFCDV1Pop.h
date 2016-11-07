//
//  YFCDV1Pop.h
//  day39-project01
//
//  Created by apple on 15/11/29.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFCDV1Pop : UIView

@property (nonatomic,strong)NSArray *datas;
@property (nonatomic,strong)void (^onClick)(NSInteger idx);
@property (nonatomic,strong)void (^onStateChange)(BOOL show);
-(void)show2v:(UIView *)v;
-(void)dismiss;
@end
