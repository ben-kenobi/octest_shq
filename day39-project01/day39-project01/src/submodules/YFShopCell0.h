//
//  YFShopCell0.h
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFShopCell0 : UITableViewCell


@property (nonatomic,strong)NSDictionary *dict;
@property (nonatomic,strong)void(^checkDetail)(NSDictionary*goodinfo);
@end
