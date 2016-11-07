//
//  YFPromptV.h
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFPromptV : UIView

@property (nonatomic,strong)UIImageView *img;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UIButton *ok;
@property (nonatomic,strong)UIButton *cancel;
@property (nonatomic,strong)UIView *mainbg;
@property (nonatomic,copy)void (^onOK)(YFPromptV *v);
@property (nonatomic,copy)void (^onCancel)(YFPromptV *v);
+(void)showToView:(UIView *)view  cus:(void (^)(YFPromptV *v))cusB;
@end
