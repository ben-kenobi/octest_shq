//
//  YFEmojiKB.h
//  day39-project01
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFEmojiKB : UIView

@property (nonatomic,strong)NSMutableArray *datas;
-(void)appendDatas:(NSArray *)ary;
@property (nonatomic,strong)void(^emojiClick)(NSString *name);
@end
