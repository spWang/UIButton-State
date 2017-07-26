//
//  UIColor+Hex.m
//  ToolKit
//
//  Created by wangshuaipeng on 16/9/2.
//  Copyright © 2016年 Mac－pro. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (instancetype)hcb_colorWithHex:(u_int32_t)hex {
    return [self hcb_colorWithHex:hex alpha:1.0f];
}

+ (instancetype)hcb_colorWithHex:(u_int32_t)hex alpha:(CGFloat)alpha {
    int red = (hex & 0xFF0000) >> 16;
    int green = (hex & 0x00FF00) >> 8;
    int blue = hex & 0x0000FF;
    return [self colorWithR:red / 255.0 g:green / 255.0 b:blue / 255.0 alpha:alpha];
}

+ (UIColor *)hcb_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] <3 || [cString length] > 8) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]||[cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if (!([cString length] == 6 || [cString length] ==3)) {
        return [UIColor clearColor];
    }
    
    if ([cString length] == 6) {
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        //r
        NSString *rString = [cString substringWithRange:range];
        //g
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        //b
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        return  [self colorWithR:((float)r / 255.0f) g:((float)g / 255.0f) b:((float)b / 255.0f) alpha:alpha];
    }else{
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 1;
        //r
        NSString *rString = [cString substringWithRange:range];
        rString = [NSString stringWithFormat:@"%@%@",rString,rString];
        //g
        range.location = 1;
        NSString *gString = [cString substringWithRange:range];
        gString = [NSString stringWithFormat:@"%@%@",gString,gString];
        //b
        range.location = 2;
        NSString *bString = [cString substringWithRange:range];
        bString = [NSString stringWithFormat:@"%@%@",bString,bString];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        return [self colorWithR:((float)r / 255.0f) g:((float)g / 255.0f) b:((float)b / 255.0f) alpha:alpha];
    }
}

//默认alpha值为1
+ (UIColor *)hcb_colorWithHexString:(NSString *)color {
    return [self hcb_colorWithHexString:color alpha:1.0f];
}


+ (instancetype)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue alpha:(CGFloat)alpha {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f) {
        return [UIColor colorWithDisplayP3Red:red green:green blue:blue alpha:alpha];
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end
