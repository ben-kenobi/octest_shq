//
//  YFAlbumCell.h
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFAlbumCell : UICollectionViewCell
@property (nonatomic,strong)UIImageView *imgv;
@property (nonatomic,strong)UILabel *lab;
@property (nonatomic,strong)UILabel *lab2;
-(void)setFileImg:(NSString *)path;
@end
