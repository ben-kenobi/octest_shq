

//
//  YFThirdLogin.m
//  day39-project01
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFThirdLogin.h"
#import "YFHomeCell1.h"


#define CELL1 @"thirdlogincelliden"
@interface YFThirdLogin ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *cv;

@end

@implementation YFThirdLogin
@synthesize datas=_datas;
-(void)drawRect:(CGRect)rect{
    [iGlobalBlue set];
    CGSize size=[@"第三方登陆" boundingRectWithSize:(CGSize){CGFLOAT_MAX,CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:iFont(14),NSForegroundColorAttributeName:iGlobalBlue} context:0].size;
    [@"第三方登陆" drawAtPoint:(CGPoint){(self.w-size.width)*.5,0} withAttributes:@{NSFontAttributeName:iFont(14),NSForegroundColorAttributeName:iGlobalBlue}];
    CGContextRef con=  UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(con, 15, size.height+10);
    CGContextSetLineWidth(con, .5);
    CGContextAddLineToPoint(con, self.w-15, size.height+10);
    CGContextDrawPath(con, 2);
}



-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
        [lo setMinimumInteritemSpacing:0];
        [lo setMinimumLineSpacing:0];
        [lo setSectionInset:(UIEdgeInsets){0,20,0,20}];
        [lo setItemSize:(CGSize){65	,75}];
        
        self.cv=[[UICollectionView alloc] initWithFrame:(CGRect){0,40,self.w,self.h-40} collectionViewLayout:lo];
        self.cv.delegate=self;
        self.cv.dataSource=self;
        [self.cv registerClass:[YFHomeCell1 class] forCellWithReuseIdentifier:CELL1];
        self.cv .bounces=NO;
        [self addSubview:self.cv];
        [self.cv setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YFHomeCell1 *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CELL1 forIndexPath:indexPath];
    cell.dict=self.datas[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.onclick){
        self.onclick(self.datas[indexPath.row]);
    }
}
-(void)setDatas:(NSMutableArray *)datas{
    _datas=datas;
    [self.cv reloadData];
}
iLazy4Ary(datas, _datas)
@end
