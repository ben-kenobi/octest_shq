//
//  YFHomeCell1.h
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSGroupModel;
@interface YFHomeCell1 : UICollectionViewCell

@property (nonatomic,strong)DSGroupModel *m;

@property (nonatomic,strong)NSDictionary *dict;

@end


@interface YFCellBtn :UIButton

@end