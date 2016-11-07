//
//  YFShopHeader.h
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFGoodCell2,YFGoodCell1;

@interface YFShopHeader : UIView

@property (nonatomic,strong)NSDictionary *dict;
@property (nonatomic,strong)YFGoodCell2 *cell2;
@property (nonatomic,strong)YFGoodCell1 *cell1;
@end
