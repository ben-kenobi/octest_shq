




//
//  YFCirDeTopV.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCirDeTopV.h"

@interface YFCirDeTopV ()
@property (nonatomic,strong)NSMutableArray *btns;
@property (nonatomic,strong)UIView *line;
@end


@implementation YFCirDeTopV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.layer.shadowOpacity=.3;
        self.layer.shadowOffset=(CGSize){0,1};
        self.layer.shadowColor=[[UIColor blackColor]CGColor];
        self.layer.shadowRadius=2;
        
    }
    return self;
}

-(void)setTitles:(NSArray *)titles{
    _titles=titles;
    [[self subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    [self initUI];
}

-(void)initUI{
    
    UIView *grayline= [[UIView alloc] initWithFrame:(CGRect){0,self.h-1,self.w,1}];
    [self addSubview:grayline];
    [grayline setBackgroundColor:iGlobalBG];
    UIButton *(^newb)(CGRect ,NSString *)=^(CGRect frame,NSString *title){
        UIButton *b=[[UIButton alloc] initWithFrame:frame];
        [b setTitle:title forState:0];
        [b setTitleColor:iColor(100, 100, 100, 1) forState:0];
        [b setTitleColor:iGlobalBlue forState:4];
        [self addSubview:b];
        [b setBackgroundColor:[UIColor clearColor]];
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        return b;
    };
    
    CGFloat btw=self.w/self.titles.count;
    self.btns=[NSMutableArray array];
    int ind=0;
    for(NSString *str in _titles){
        if(ind>0){
           UIView *li= [[UIView alloc] initWithFrame:(CGRect){ind*btw,0,1,self.h}];
            [li setBackgroundColor:iGlobalBG];
            [self addSubview:li];
        }
        [self.btns addObject:newb((CGRect){ind*btw,0,btw,self.h},str)];
        ind++;
    }
    
    self.line=[[UIView alloc] initWithFrame:(CGRect){0,self.h-2.5,btw,2.5}];
    [self.line setBackgroundColor:iGlobalBlue];
    [self addSubview:self.line];
    [self onBtnClicked:self.btns[self.btns.count/2]];
    
}
-(void)selectAtIdx:(NSInteger)ind ani:(BOOL)ani{
    if(ind>self.btns.count-1||ind<0)return ;
    [self.btns enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
           [ obj setSelected:ind==idx ];
    }];
    if(ani)
        [UIView animateWithDuration:.3 animations:^{
            _line.x=ind*_line.w;
        }];
    else
        _line.x=ind*_line.w;
}
-(void)onBtnClicked:(UIButton *)sender{
    NSInteger ind=[self.btns indexOfObject:sender];
    [self selectAtIdx:ind ani:YES];
    if(self.onChange)
        self.onChange(ind);
}

@end
