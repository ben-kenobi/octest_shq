//
//  YFShopTv.h
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFShopTv : UITableView

@property (nonatomic,strong)NSDictionary *dict;
@property (nonatomic,strong)NSMutableArray *goods;
@property (nonatomic,strong)NSMutableArray *comments;

-(void)appendGoods:(NSArray *)goods;
-(void)appendComments:(NSArray *)comments;

@property (nonatomic,strong)void(^loadMore)(NSInteger section);

@end
