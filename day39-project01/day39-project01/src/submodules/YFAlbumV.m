

//
//  YFAlbumV.m
//  day39-project01
//
//  Created by apple on 15/11/27.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFAlbumV.h"
#import "YFAlbumCell.h"
#import "YFHomeCVHeader.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define cellIden @"AlbumCellIden"
#define headerIden @"AlbumHeaderIden"

@interface YFAlbumV ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *cv;
@property (nonatomic,strong)NSMutableArray  *group;
@property (nonatomic,strong)ALAssetsLibrary *assetsLibrary;
@end

@implementation YFAlbumV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self setBackgroundColor:iColor(0, 0, 0, .5)];
        UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
        [lo setMinimumInteritemSpacing:1];
        [lo setMinimumLineSpacing:1];
        CGFloat pad=20,cvw=self.w-pad*2,itemw=(cvw-10)/3-1;
        [lo setSectionInset:(UIEdgeInsets){5,5,5,5}];
        [lo setItemSize:(CGSize){itemw,itemw}];
        self.cv=[[UICollectionView alloc] initWithFrame:(CGRect){pad,pad,cvw,self.h-40} collectionViewLayout:lo];
        [self.cv setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.cv];
        self.cv.delegate=self;
        self.cv.dataSource=self;

        [self.cv registerClass:[YFHomeCVHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIden];
        [self.cv registerClass:[YFAlbumCell class] forCellWithReuseIdentifier:cellIden];
        [self loadDatas];
    }
    return self;
}

-(void)loadDatas{
    NSUInteger groupTypes = ALAssetsGroupAll;
    self.assetsLibrary = [[ALAssetsLibrary alloc]  init];
    NSMutableArray *ary=[NSMutableArray array];
    [self.assetsLibrary enumerateGroupsWithTypes:groupTypes
                                 usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                     if(group)
                                         [ary addObject:group];
                                     else
                                         [self appendDatas:ary];

                                 } failureBlock:^(NSError *error) {
                                     NSLog(@"%@",error);
                                 } ];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:.3 animations:^{
        self.alpha=0;
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return section?self.group.count:self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YFAlbumCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIden forIndexPath:indexPath];
    if(indexPath.section){
        ALAsset *ass=self.group[indexPath.row];
        cell.imgv.image=[UIImage imageWithCGImage: ass.thumbnail];
        cell.lab2.hidden=YES;cell.lab.hidden=YES;
    }else{
        ALAssetsGroup *group=self.datas[indexPath.row];
        cell .imgv.image=[UIImage imageWithCGImage: group.posterImage];
        cell.lab.text=[group valueForProperty:ALAssetsGroupPropertyName];
        cell.lab2.hidden=NO;
        cell.lab.hidden=NO;
        cell.lab2.text=iFormatStr(@"%ld",group.numberOfAssets);
    }
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    YFHomeCVHeader *header=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIden forIndexPath:indexPath];
    header.lab.text=indexPath.section?@"选择图片":@"选择相册";
    return header;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section){
        if(self.onSel){
            ALAsset *ass=self.group[indexPath.row];
            self.onSel([UIImage imageWithCGImage: ass.defaultRepresentation.fullResolutionImage]);
        }
    }else{
        self.group=[NSMutableArray array];
       ALAssetsGroup *g= self.datas[indexPath.row];
        
        [g enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
                [self.group addObject:result];
        }];
        
        [self.cv reloadSections:[NSIndexSet indexSetWithIndex:1]];

    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return (CGSize){self.w,40};
}

-(void)appendDatas:(NSArray *)datas{
    [self.datas addObjectsFromArray:datas];
    [self.cv reloadData];
}

iLazy4Ary(datas, _datas)
@end
