//
//  YFAlbumV.h
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFAlbumV : UIView

@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)void(^onSel)(UIImage *img);
@end
