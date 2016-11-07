

//
//  YFCDV1Pop.m
//  day39-project01
//
//  Created by apple on 15/11/29.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCDV1Pop.h"



@interface YFCDV1Pop ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,weak)UIButton *sup;
@end


@implementation YFCDV1Pop

-(void)show2v:(UIView *)v{
    UIButton *sup=[[UIButton alloc] initWithFrame:v.bounds];
    sup.backgroundColor=[UIColor clearColor];
    [v addSubview:sup];
    [sup addSubview:self];
    self.sup=sup;
    sup.alpha=0;
    [UIView animateWithDuration:.3 animations:^{
        sup.alpha=1;
    }];

    [sup addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    if(self.onStateChange)
        self.onStateChange(1);
}
-(void)dismiss{
    [UIView animateWithDuration:.3 animations:^{
        self.sup.alpha=0;
    }completion:^(BOOL finished) {
        [self.sup removeFromSuperview];
        if(self.onStateChange)
            self.onStateChange(0);
    }];
   
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.tv=[[UITableView alloc] initWithFrame:self.bounds];
        self.tv.delegate=self;
        self.tv.dataSource=self;
        self.tv.separatorStyle=0;
        self.tv.backgroundColor=iColor(0, 0, 0, .6);
        [self addSubview:self.tv];
    }
    return self;
}

#pragma mark delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismiss];
    if(self.onClick)
        self.onClick(indexPath.row);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const iden=@"popcelliden";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:iden];
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.contentView.backgroundColor=[UIColor clearColor];
        cell.backgroundColor=[UIColor clearColor];
    }
    cell.imageView.image=img(@"login_qq");
    cell.textLabel.text=self.datas[indexPath.row];
    
    return cell;
}
-(void)setDatas:(NSArray *)datas{
    _datas=datas;
    [self.tv reloadData];
}

@end
