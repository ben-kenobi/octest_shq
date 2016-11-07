

//
//  YFWebVVC.m
//  day39-project01
//
//  Created by apple on 15/11/30.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFWebVVC.h"

@interface YFWebVVC ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *wv;
@end

@implementation YFWebVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wv=[[UIWebView alloc] initWithFrame:(CGRect){0,iTopBarH,self.view.w,self.view.h-iTopBarH}];
    [self.view addSubview:self.wv];
    self.wv.delegate=self;
    [self.wv loadRequest:[NSURLRequest requestWithURL:iURL(_url)]];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
