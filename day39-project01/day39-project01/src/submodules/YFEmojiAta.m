//
//  YFEmojiAta.m
//  day35-map
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "YFEmojiAta.h"

@implementation YFEmojiAta

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex{
    return (CGRect){0,-5,lineFrag.size.height,lineFrag.size.height};
}

+(NSString *)strFromAstr:(NSAttributedString *)astr{
    NSMutableString *mstr=[NSMutableString stringWithString:astr.string];
    [astr enumerateAttribute:@"NSAttachment" inRange:(NSRange){0,astr.length} options:NSAttributedStringEnumerationReverse usingBlock:^(id value, NSRange range, BOOL *stop) {
        if(value&&[value isKindOfClass:self]){
            [mstr replaceCharactersInRange:range withString:[value name]];
        }
    }];
    return mstr;
}

-(NSString *)description{
    return self.name;
}
@end
