

//
//  YFEmojiCV.m
//  day39-project01
//
//  Created by apple on 15/11/25.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFEmojiCV.h"
#import "YFEmojiCell.h"



static NSString *const celliden=@"emojicelliden";

@interface YFEmojiCV ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *cv;

@end

@implementation YFEmojiCV


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
        [lo setMinimumInteritemSpacing:0];
        [lo setMinimumLineSpacing:0];
        [lo setItemSize:(CGSize){self.w/7.0,self.w/7.0}];
        self.cv=[[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:lo];
        self.cv.delegate=self;
        self.cv.dataSource=self;
        [self addSubview:self.cv];
        [self.cv registerClass:[YFEmojiCell class] forCellWithReuseIdentifier:celliden];
        [self.cv setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.emojiClick){
        self.emojiClick(self.datas[indexPath.row]);
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YFEmojiCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:celliden forIndexPath:indexPath];

    cell.img=[UIImage gifImg:iData4F(iRes( self.datas[indexPath.row]))];
   ;

    return cell;
}

-(void)setDatas:(NSMutableArray *)datas{
    _datas=datas;
    [self.cv reloadData];
    
}
@end
