
//
//  YFUserInfoCell.m
//  day39-project01
//
//  Created by apple on 15/11/26.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFUserInfoCell.h"

@implementation YFUserInfoCell

-(void)drawRect:(CGRect)rect{
    CGContextRef con=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(con, 0, self.h-.5);
    CGContextAddLineToPoint(con, self.w, self.h-.5);
    [[UIColor lightGrayColor] setStroke];
    CGContextDrawPath(con, 2);
}

+(instancetype)cellWithTv:(UITableView *)tv {
    static NSString *const iden=@"userinfocelliden";
    YFUserInfoCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:iden];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setSelectionStyle:0];
    }
    return cell;
}

@end
