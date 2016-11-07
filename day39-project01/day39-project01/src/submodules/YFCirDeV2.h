//
//  YFCirDeV2.h
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFBasVC.h"
@interface YFCirDeV2 : UIView
@property (nonatomic,strong)NSMutableArray *datas;
-(void)appendDatas:(NSArray *)datas;
@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,weak)YFBasVC *vc;
@end
