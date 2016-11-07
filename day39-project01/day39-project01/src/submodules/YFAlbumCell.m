

//
//  YFAlbumCell.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFAlbumCell.h"
#import "UIImageView+WebCache.h"

@implementation YFAlbumCell
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.imgv=[[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:self.imgv];
        self.lab=[[UILabel alloc] initWithFrame:(CGRect){0,self.h-30,self.w,30}];
        [self.lab setTextColor:[UIColor blackColor]];
        [self.lab setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.lab];
        self.lab2 =[[UILabel alloc] initWithFrame:(CGRect){2,2,36,36}];
        self.lab2.layer.cornerRadius=18;
        self.lab2.font=iFont(13);
        self.lab2.layer.masksToBounds=YES;
        [self.lab2 setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.lab2];
        [self.lab2 setBackgroundColor:iColor(255, 255, 255, .7)];
        [self.lab2 setTextColor:[UIColor orangeColor]];
        
    }
    return self;
}

-(void)setFileImg:(NSString *)path{
    [self.imgv sd_setImageWithURL:iURL(iFormatStr(@"file://%@",path)) placeholderImage:img(@"114") options:SDWebImageCacheMemoryOnly];
}
@end
