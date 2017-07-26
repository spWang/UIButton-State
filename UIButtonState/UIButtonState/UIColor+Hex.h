//
//  UIColor+Hex.h
//  ToolKit
//
//  Created by wangshuaipeng on 16/9/2.
//  Copyright © 2016年 Mac－pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

///支持 0X123456、0x123456(效率高)
+ (instancetype)hcb_colorWithHex:(u_int32_t)hex;

///支持 0X123456、0x123456(效率高)
+ (instancetype)hcb_colorWithHex:(u_int32_t)hex alpha:(CGFloat)alpha;

///从十六进制字符串获取颜色,color:支持@“#123456”、 @“0X123456”、@“0x123456”、 @“123456”四种格式
+ (instancetype)hcb_colorWithHexString:(NSString *)color;

///从十六进制字符串获取颜色,color:支持@“#123456”、 @“0X123456”、@“0x123456”、 @“123456”四种格式
+ (instancetype)hcb_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
