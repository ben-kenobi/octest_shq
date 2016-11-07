
//
//  YFHomeCell1.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeCell1.h"
#import "DSHomeModel.h"

@interface YFHomeCell1 ()
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)YFCellBtn *btn;
@end

@implementation YFHomeCell1


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
//        CGFloat pad=10;
//        self.icon=[[UIImageView alloc] init];
//        [self.contentView addSubview:self.icon];
//        self.title=[[UILabel alloc] init];
//        [self.contentView addSubview:self.title];
//        [self.title setFont:iFont(14)];
//        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(@(pad*1.3));
//            make.right.equalTo(@(-pad*1.3));
//            make.top.equalTo(@(pad));
//            make.height.equalTo(self.icon.mas_width);
//        }];
//        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(@0);
//            make.bottom.equalTo(@(-pad*.5));
//        }];
//
        self.btn=[[YFCellBtn alloc] initWithFrame:self.bounds];
        [self.btn.imageView setContentMode:(UIViewContentModeScaleAspectFit)];
        [self.contentView addSubview:self.btn];
        self.btn.titleLabel.font=iFont(14);
        [self.btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self setBackgroundColor:[UIColor whiteColor]];

    }
    return self;
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    [self.btn setImage:img(dict[@"icon"]) forState:UIControlStateNormal] ;
    [self.btn setTitle:dict[@"name"] forState:UIControlStateNormal];
}


-(void)setM:(DSGroupModel *)m{
    _m=m;
//    self.icon.image=img(@"login_qq");
//    if([m.title isEqualToString:@"更多"]){
//        self.title.text=m.title;
//    }else
//    self.title.text=[m.title  stringByAppendingString:@"圈"];
    
    [self.btn setImage:img(@"login_qq") forState:UIControlStateNormal] ;
    
    if([m.title isEqualToString:@"更多"]){
        [self.btn setTitle:m.title forState:UIControlStateNormal];
    }else
        [self.btn setTitle:[m.title  stringByAppendingString:@"圈"] forState:UIControlStateNormal];
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if(self.userInteractionEnabled==NO||self.hidden==YES||self.alpha<=.01)
        return 0;
    if([self pointInside:point withEvent:event])
        return self;
    return 0;
}

@end



@implementation YFCellBtn
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return (CGRect){0,self.h-25,self.w,20};
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
     return (CGRect){13,10,self.w-26,self.h-36};
}




@end
