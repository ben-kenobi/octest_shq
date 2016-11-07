
//
//  YFCirDeV0.m
//  day39-project01
//
//  Created by apple on 15/11/28.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCirDeV0.h"
#import "YFWebVVC.h"

@interface YFCirDeV0 ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *wv;


@end

@implementation YFCirDeV0
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.wv=[[UIWebView alloc] initWithFrame:self.bounds];
        [self addSubview:_wv];
        [_wv loadRequest:[NSURLRequest requestWithURL:iURL(@"https://www.baidu.com/")]];
        _wv.delegate=self;
    }
    return self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str=    request.URL.absoluteString;
    if( [str isEqualToString:@"https://www.baidu.com/"]){
        return YES;
    }else if([str isEqualToString:@"about:blank"]){
        return NO;
    }else{
        YFWebVVC *vc=[[YFWebVVC alloc] init];
        vc.url=str;
        [UIViewController pushVC:vc];
        return NO;
    }
    

}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"start%@",webView.request.URL.absoluteString);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
        NSLog(@"finish%@",webView.request.URL.absoluteString);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
        NSLog(@"fail%@",webView.request.URL.absoluteString);
}
@end
