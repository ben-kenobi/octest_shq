//
//  YFLoginTF.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFLoginTF.h"

@interface YFLoginTF  ()
@property (nonatomic,strong)UIImageView *lv;


@end

@implementation YFLoginTF


+(instancetype)tfWithFrame:(CGRect)frame img:(UIImage *)img ph:(NSString *)ph{
    YFLoginTF *obj=[[self alloc] initWithFrame:frame];
    
    [obj setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:ph attributes:@{NSFontAttributeName:iFont(15),NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    
    obj.textColor=[UIColor whiteColor] ;
    [obj setTintColor:[UIColor whiteColor]];
     obj.font=iFont(15);
   [ obj.lv setImage:img];
    return obj;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UIView *bg=[[UIView alloc ] initWithFrame:(CGRect){0,0,self.h+6,self.h}];
        [bg setBackgroundColor:[UIColor clearColor]];
        self.lv=[[UIImageView alloc] initWithFrame:(CGRect){0,0,self.h,self.h}];
        [bg addSubview:self.lv];
        [self.lv setBackgroundColor:iColor(60, 168, 245, 1)];
        self.leftView=bg;
        self.leftViewMode=UITextFieldViewModeAlways;
        [self setBackgroundColor:iColor(116, 201, 255, 1)];

    }
    return self;
}

@end
