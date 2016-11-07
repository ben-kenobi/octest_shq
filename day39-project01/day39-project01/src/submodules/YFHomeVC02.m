
//
//  YFHomeVC02.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeVC02.h"
#import "YFHomeCV.h"
#import "DSHomeModel.h"

@interface YFHomeVC02 ()
@property (nonatomic,strong)YFHomeCV *cv;
@end

@implementation YFHomeVC02

- (void)viewDidLoad {
    [super viewDidLoad];

        self.cv=[[YFHomeCV alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH-iTabBarH}];
        [self.view addSubview:self.cv];
      [self.cv setBackgroundColor:iColor(220, 220, 220, 1)];
        [self loadDatas];
        
        

}
-(void)loadDatas{
    NSDictionary *dict=iRes4dict(@"home.plist");

    DSHomeModel *model=[[DSHomeModel alloc] initWithDictionary:dict error:0];

    [self.cv setHomem:model];


}

@end
