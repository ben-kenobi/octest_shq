//
//  YFHomeHV.h
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFHomeHV : UICollectionReusableView

@property (nonatomic,strong)NSMutableArray *datas;


-(void)appendDatas:(NSArray *)datas;
@end
