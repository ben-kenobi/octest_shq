//
//  YFEmojiCV.h
//  day39-project01
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFEmojiCV : UICollectionViewCell

@property (nonatomic,strong)NSMutableArray *datas;

@property (nonatomic,strong)void(^emojiClick)(NSString *name);

@end
