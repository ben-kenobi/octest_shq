



//
//  YFHomeCV.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeCV.h"
#import "YFHomeHV.h"
#import "YFHomeCell1.h"
#import "DSHomeModel.h"
#import "YFHomeCVHeader.h"
#import "YFHomeCell2.h"
#import "YFHomeCell3.h"
#import "YFGoodVC.h"
#import "YFShopVC.h"
#import "YFCircleDetailVC.h"

#define ADIDEN @"adheaderiden"
#define HIDEN @"headeriden"
#define CELL1 @"celliden1"
#define CELL2 @"celliden2"
#define CELL3 @"celliden3"

@interface YFHomeCV ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YFHomeCV

-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
    [lo setMinimumInteritemSpacing:0];

    [lo setMinimumLineSpacing:0];
    
    if(self=[super initWithFrame:frame collectionViewLayout:lo]){
        self.delegate=self;
        self.dataSource=self;
        
        [self registerClass:[YFHomeHV class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader    withReuseIdentifier:ADIDEN];
        
         [self registerClass:[YFHomeCVHeader class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader    withReuseIdentifier:HIDEN];
        
        [self registerClass:[YFHomeCell1 class] forCellWithReuseIdentifier:CELL1];
        [self registerClass:[YFHomeCell2 class] forCellWithReuseIdentifier:CELL2];
        [self registerClass:[YFHomeCell3 class] forCellWithReuseIdentifier:CELL3];
      
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section==0){
        return self.homem.group.list.count;
    }else if(section==1){
        return self.homem.famous.list.count;
    }else{
        return self.homem.guess.list.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section==0){
        YFHomeCell1 *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CELL1 forIndexPath:indexPath];
        cell.m=self.homem.group.list[indexPath.row];
        return cell;
    }else if(indexPath.section==1){
    
        YFHomeCell2 *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CELL2 forIndexPath:indexPath ];
        cell.m=self.homem.famous.list[indexPath.row];
        
        return cell;
    }else{
        YFHomeCell3 *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CELL3 forIndexPath:indexPath ];
        cell.m=self.homem.guess.list[indexPath.row];
        
        return cell;
    }
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        YFHomeHV *view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ADIDEN forIndexPath:indexPath];
        if(view.datas.count==0){
            [view setBackgroundColor:[UIColor whiteColor]];
            [view appendDatas:self.homem.focus.list];
        }
        return view;
    }else{
        YFHomeCVHeader *view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HIDEN forIndexPath:indexPath];
        
        view.lab.text=indexPath.section==1?@"名店推荐":@"猜你喜欢";
        view.lab.textColor=indexPath.section==1?[UIColor colorWithRed:1.000 green:0.307 blue:0.157 alpha:1.000]
        :[UIColor colorWithRed:1.000 green:0.295 blue:0.832 alpha:1.000]
        ;
        
        return view;
    }
    

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        return (CGSize){self.w/4-.5,90};
    }else if(indexPath.section==1){
        return (CGSize){self.w/2-.5,90};
    }else {
        return (CGSize){self.w,90};
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==2){
        [UIViewController pushVC:[[YFGoodVC alloc] init]];
    }else if(indexPath.section==1){
        [UIViewController pushVC:[[YFShopVC alloc] init]];
    }else if(indexPath.section==0&&indexPath.row<7){
      YFCircleDetailVC *vc=  [[YFCircleDetailVC alloc] init];
       vc.m=self.homem.group.list[indexPath.row];
        [UIViewController pushVC:vc];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [iNotiCenter postNotificationName:HOMESCROLLIDEN object:0];
}






- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return section ==0?1:.5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
     return section ==0?0:.5;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return section?(CGSize){self.w,30}:(CGSize){self.w,150};
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return section==1?(UIEdgeInsets){0,0,10,0}:(UIEdgeInsets){0,0,5,0};
}




-(void)setHomem:(DSHomeModel *)homem{
    _homem=homem;
    [self reloadData];
}




@end
