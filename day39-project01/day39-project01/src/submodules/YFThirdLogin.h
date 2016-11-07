//
//  YFThirdLogin.h
//  day39-project01
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFThirdLogin : UIView
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,copy)void (^onclick)(NSDictionary *dict);
@end
