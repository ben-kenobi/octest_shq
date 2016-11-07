//
//  YFHotVC.m
//  day39-project01
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHotVC.h"
#import "YFEmojiKB.h"
#import "UIImage+GIF.h"
#import "YFEmojiAta.h"

static CGFloat const cFontSize=20;
@interface YFHotVC ()<UITextViewDelegate>
@property (nonatomic,strong)UITextField *topic;
@property (nonatomic,strong)UITextView *content;
@property (nonatomic,strong)UIButton *addemo;
@property (nonatomic,strong)UIButton *addimg;
@property (nonatomic,strong)UIButton *commit;
@property (nonatomic,strong)YFEmojiKB *emocv;

@property (nonatomic,strong)NSRegularExpression *digitre;
@property (nonatomic,strong)NSRegularExpression *emojire;

@end

@implementation YFHotVC

- (void)onChange:(NSNotification*)noti{
   NSString *str= self.content.attributedText.string;
   NSArray *ary= [self.emojire matchesInString:str options:NSMatchingReportCompletion range:(NSRange){0,str.length}];
    if(!ary.count) return ;
    NSMutableAttributedString *astr=[[NSMutableAttributedString alloc]initWithAttributedString:self.content.attributedText];
    if(ary.count==1){
        NSRange range=[ary[0] range];
        if(range.location==astr.length-3)
            return;
    }
    for(NSInteger i=ary.count-1;i>=0;i--){
        NSTextCheckingResult *res=ary[i];
        YFEmojiAta *atta=[[YFEmojiAta alloc] init];
        NSString *shrt=[str substringWithRange:res.range];
       UIImage *img=[UIImage gifImgF:iRes([self fullEmoStr:shrt])];
        [img setValue:@1 forKeyPath:@"duration"];
        atta.image=img;
        [atta.image setValue:@3 forKeyPath:@"duration"];
        atta.name=shrt;
        [astr replaceCharactersInRange:res.range withAttributedString:[NSAttributedString attributedStringWithAttachment:atta]];

    }
    self.content.attributedText=astr;
    self.content.font=iFont(cFontSize);
}
-(void)dealloc{
    [iNotiCenter removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:iGlobalBG];
    [self initUI];
}

-(void)initUI{
    CGFloat pad=10;
    UILabel *titlelab=[[UILabel alloc] initWithFrame:(CGRect){pad,pad+iTopBarH,self.view.w-pad*2,20}];
    titlelab.font=iFont(14);
    [self.view addSubview:titlelab];
    titlelab.text=@"快来爆料你身边的事吧";
    
    self.topic=[[UITextField alloc] initWithFrame:(CGRect){pad,titlelab.b+5,titlelab.w,36}];
    self.topic.backgroundColor=[UIColor whiteColor];
    self.topic.layer.cornerRadius=3;
    self.topic.layer.masksToBounds=YES;
    [self.view addSubview:self.topic];
    
    UILabel *contentlab=[[UILabel alloc] initWithFrame:(CGRect){pad,self.topic.b+5,self.topic.w,20}];
    contentlab.text=@"正文";
    [self.view addSubview:contentlab];
    
    self.content=[[UITextView alloc] initWithFrame:(CGRect){pad,contentlab.b+5,titlelab.w,titlelab.w*.7}];
    self.content.font=iFont(cFontSize);
    self.content.backgroundColor=[UIColor whiteColor];
    self.content.layer.cornerRadius=3;
    self.content.layer.masksToBounds=YES;
    [self.view addSubview:self.content];
    
    UIButton *(^newb)(NSString *,CGRect ,UIImage *,UIFont *)=^(NSString *title,CGRect frame,UIImage *img,UIFont *font){
        UIButton *b=[[UIButton alloc] initWithFrame:frame];
        [b setImage:img forState:UIControlStateNormal];
        [b setTitle:title forState:UIControlStateNormal];
        [self.view addSubview:b];
        [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b setTitleColor:iGlobalGreen forState:1];
        b.titleLabel.font=font;
        [b setBackgroundColor:iGlobalBlue];
        b.layer.cornerRadius=1;
        b.layer.masksToBounds=YES;
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        return b;
    };
    CGFloat btnw=100;
    self.addemo=newb(@"添加表情",(CGRect){titlelab.w-btnw*2-12+pad,self.content.b+7,btnw,35},img(@"user_info"),iBFont(13));
    self.addimg=newb(@"添加图片",(CGRect){self.addemo.r+12,self.addemo.y,btnw,35},img(@"user_info"),iBFont(13));
    
    self.commit=newb(@"提交",(CGRect){pad*2,self.view.h-25-iTabBarH-35,self.view.w-pad*4,35},0,iBFont(16));
    
    [iNotiCenter addObserver:self selector:@selector(onChange:) name:UITextViewTextDidChangeNotification object:self.content];
    
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.addemo){
        [self showemo:self.emocv.hidden];
    }else if(sender==self.addimg){
        
    }else if(sender==self.commit){
        
    }
}


-(void)showemo:(BOOL)b{
    _emocv.hidden=NO;
    if(b){
        [UIView animateWithDuration:.3 animations:^{
            _emocv.alpha=1;
        }];
    }else{
        [UIView animateWithDuration:.3 animations:^{
            _emocv.alpha=0;
        } completion:^(BOOL finished) {
            _emocv.hidden=YES;
        }];
    }
}
-(YFEmojiKB *)emocv{
    if(!_emocv){
        _emocv=[[YFEmojiKB alloc] initWithFrame:(CGRect){2+self.content.x,self.content.y+50,self.content.w-4,self.content.h-52}];
        _emocv.backgroundColor=self.view.backgroundColor;
        _emocv.layer.cornerRadius=3;
        _emocv.layer.masksToBounds=YES;
        [self.view addSubview:_emocv];
        _emocv.alpha=0;
        _emocv.hidden=YES;
        NSMutableArray *ary=[NSMutableArray array];
        for(int i=0;i<17;i++){
            [ary addObject:iFormatStr(@"emotion%d.gif",i)];
        }
        
        [_emocv appendDatas:@[ary,ary,ary,ary,ary,ary]];
        __weak typeof (self) ws=self;
        [_emocv setEmojiClick:^(NSString *name) {
            NSMutableAttributedString *mastr= [[NSMutableAttributedString alloc] initWithAttributedString:ws.content.attributedText];
            YFEmojiAta *atta=[[YFEmojiAta alloc] init];
            atta.image=[UIImage gifImgF:iRes(name)];
            atta.name=[ws shortEmoStr:name];
            [mastr appendAttributedString:[NSAttributedString attributedStringWithAttachment:atta]];
            ws.content.attributedText=mastr;
            ws.content.font=iFont(cFontSize);
        }];
    }
    return _emocv;
}

-(NSString *)shortEmoStr:(NSString *)full{
    NSTextCheckingResult *res=[self.digitre firstMatchInString:full options:NSMatchingReportCompletion range:(NSRange){0,full.length}];
    return iFormatStr(@"/e%@",[full substringWithRange:res.range]);
}

-(NSString *)fullEmoStr:(NSString *)shrt{
    return iFormatStr(@"emotion%@.gif",[shrt substringFromIndex:2]);
}

-(NSRegularExpression *)emojire{
    if(!_emojire){
        _emojire=[NSRegularExpression regularExpressionWithPattern:@"/e((1[0-6])|[0-9])" options:0 error:0];
    }
    return _emojire;
}
-(NSRegularExpression *)digitre{
    if(!_digitre){
        _digitre=[NSRegularExpression regularExpressionWithPattern:@"[0-9]{1,3}" options:0 error:0];
    }
    return _digitre;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

@end
