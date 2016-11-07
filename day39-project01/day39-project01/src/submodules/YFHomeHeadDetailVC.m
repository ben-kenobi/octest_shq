
//
//  YFHomeHeadDetailVC.m
//  day39-project01
//
//  Created by apple on 15/11/24.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeHeadDetailVC.h"

@interface YFHomeHeadDetailVC ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *wv;
@property (nonatomic,strong)UIActivityIndicatorView *roll;
@end

@implementation YFHomeHeadDetailVC



- (void)viewDidLoad {
    [super viewDidLoad];
    self.wv=[[UIWebView alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH}];
    [self.view addSubview:self.wv];
    [self.wv setDelegate:self];
    [self.wv loadRequest:[NSURLRequest requestWithURL:iURL(self.url)]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.roll startAnimating];
    [iApp setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.roll stopAnimating];
    [iApp setNetworkActivityIndicatorVisible:NO];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.roll stopAnimating];
    NSLog(@"%@",error);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    return [iApp setNetworkActivityIndicatorVisible:NO];
}


-(UIActivityIndicatorView *)roll{
    if(!_roll){
        _roll=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_roll setColor:[UIColor randColor]];
        [_roll setHidesWhenStopped:YES];
        _roll.center=self.wv.center;
        [self.view addSubview:_roll];
    }
    return _roll;
}

@end
