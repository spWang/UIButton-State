# UIButton-State
为按钮的backgroundColor、borderColor and titleLabelFont配置不同状态下的属性

<img src="https://github.com/spWang/UIButton-State/blob/master/demo.gif" width="375" height="667">

## <a id="如何使用"></a>如何使用
* 安装CocoaPods：`pod 'UIButtonState','~>1.0.1'`
* 文件拖拽：
* 将UIButton+State文件夹的文件拖到你的项目中
* 导入头文件：`#import "UIButton+HCBState.h"`

## <a id="UIButton+HCBState.h"></a>UIButton+HCBState.h
```objc
@interface UIButton (HCBState)
/** 获取当前borderColor */
@property(nullable, nonatomic, readonly, strong) UIColor *hcb_currentBorderColor;

/** 获取当前backgroundColor */
@property(nullable, nonatomic, readonly, strong) UIColor *hcb_currentBackgroundColor;

/** 获取当前titleLabelFont */
@property(nonatomic, readonly, strong) UIFont *hcb_currentTitleLabelFont;

/** 设置不同状态下的borderColor(支持动画效果) */
- (void)hcb_setborderColor:(UIColor *)borderColor forState:(UIControlState)state animated:(BOOL)animated;

/** 设置不同状态下的backgroundColor(支持动画效果) */
- (void)hcb_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state animated:(BOOL)animated;

/** 设置不同状态下的titleLabelFont */
- (void)hcb_setTitleLabelFont:(UIFont *)titleLabelFont forState:(UIControlState)state;

/** 获取某个状态的borderColor */
- (nullable UIColor *)hcb_borderColorForState:(UIControlState)state;

/** 获取某个状态的backgroundColor */
- (nullable UIColor *)hcb_backgroundColorForState:(UIControlState)state;

/** 获取某个状态的titleLabelFont */
- (UIFont *)hcb_titleLabelFontForState:(UIControlState)state;


/** 为自己的subView设置不同状态下的属性 */
- (void)hcb_setSubViewValue:(nullable id)value forKeyPath:(NSString *)keyPath forState:(UIControlState)state withSubViewTag:(NSInteger)tag;


#pragma mark - 使用key-value方式设置
/** key:需要将UIControlState枚举包装为NSNumber类型即可(此方式无动画) */
- (void)hcb_configBorderColors:(NSDictionary <NSNumber *,UIColor *>*)borderColors;

/** key:需要将UIControlState枚举包装为NSNumber类型即可(此方式无动画) */
- (void)hcb_configBackgroundColors:(NSDictionary <NSNumber *,UIColor *>*)backgroundColors;

/** key:需要将UIControlState枚举包装为NSNumber类型即可 */
- (void)hcb_configTitleLabelFont:(NSDictionary <NSNumber *,UIFont *>*)titleLabelFonts;


/** 切换按钮状态时,执行动画的时间,默认0.25s(只有动画执行完毕后,才能会执行下一个点击事件) */
@property (nonatomic, assign) NSTimeInterval hcb_animatedDuration;

@end
```
## <a id="例子"></a>例子
```objc
//setBackgroundColor
1. [button hcb_setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal animated:YES];

//setborderColor
2. button.layer.borderWidth = 10;
[button hcb_setborderColor:[UIColor purpleColor] forState:UIControlStateNormal animated:YES];

//setTitleLabelFont
3. [button hcb_setTitleLabelFont:[UIFont systemFontOfSize:10] forState:UIControlStateNormal];

//配置SubView
4. [button hcb_setSubViewValue:@(NSTextAlignmentLeft) forKeyPath:@"textAlignment" forState:UIControlStateNormal withSubViewTag:10001];

//使用key-Value方案来配置
5. [button hcb_configBackgroundColors:@{@(UIControlStateNormal) : [UIColor redColor], @(UIControlStateSelected) : [UIColor blueColor]}];
```

## <a id="Remind"></a>Remind
```objc
* ARC
* iOS>=6.0
```


# for English

# UIButton-State
a easy way to config your button with different backgroundColor、borderColor and titleLabelFont

## <a id="How to use it"></a>How to use it
```objc
* Installation with CocoaPods：`pod 'UIButtonState'`
* Manual import：
* Drag All files in the `UIButton+State` folder to project
* Import the file：`#import "UIButton+HCBState.h"`
```

## <a id="UIButton+HCBState.h"></a>UIButton+HCBState.h
```objc
@interface UIButton (HCBState)
/** get the current borderColor */
@property(nullable, nonatomic, readonly, strong) UIColor *hcb_currentBorderColor;

/** get the current backgroundColor */
@property(nullable, nonatomic, readonly, strong) UIColor *hcb_currentBackgroundColor;

/** get the current titleLabelFont */
@property(nonatomic, readonly, strong) UIFont *hcb_currentTitleLabelFont;

/** setting borderColor for different state(support animation) */
- (void)hcb_setborderColor:(UIColor *)borderColor forState:(UIControlState)state animated:(BOOL)animated;

/** setting backgroundColor for different state(support animation) */
- (void)hcb_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state animated:(BOOL)animated;

/** setting titleLabelFont for different state */
- (void)hcb_setTitleLabelFont:(UIFont *)titleLabelFont forState:(UIControlState)state;

/** get the borderColor for state */
- (nullable UIColor *)hcb_borderColorForState:(UIControlState)state;

/** get the backgroundColor for state */
- (nullable UIColor *)hcb_backgroundColorForState:(UIControlState)state;

/** get the titleLabelFont for state */
- (UIFont *)hcb_titleLabelFontForState:(UIControlState)state;


/** config your subView */
- (void)hcb_setSubViewValue:(nullable id)value forKeyPath:(NSString *)keyPath forState:(UIControlState)state withSubViewTag:(NSInteger)tag;


#pragma mark - use key-value
/** key:UIControlState should be NSNumber class(this way is not support animation) */
- (void)hcb_configBorderColors:(NSDictionary <NSNumber *,UIColor *>*)borderColors;

/** key:UIControlState should be NSNumber class(this way is not support animation) */
- (void)hcb_configBackgroundColors:(NSDictionary <NSNumber *,UIColor *>*)backgroundColors;

/** key:UIControlState should be NSNumber class(this way is not support animation) */
- (void)hcb_configTitleLabelFont:(NSDictionary <NSNumber *,UIFont *>*)titleLabelFonts;

/** when button state change, this property is the duration for animation, default is 0.25s(when last animation is ended, the next animation will execute) */
@property (nonatomic, assign) NSTimeInterval hcb_animatedDuration;

@end
```

## <a id="for example"></a>for example
```objc
//setBackgroundColor
1. [button hcb_setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal animated:YES];

//setborderColor
2. button.layer.borderWidth = 10;
[button hcb_setborderColor:[UIColor purpleColor] forState:UIControlStateNormal animated:YES];

//setTitleLabelFont
3. [button hcb_setTitleLabelFont:[UIFont systemFontOfSize:10] forState:UIControlStateNormal];

//set SubView use key-Value 
4. [button hcb_setSubViewValue:@(NSTextAlignmentLeft) forKeyPath:@"textAlignment" forState:UIControlStateNormal withSubViewTag:10001];

//use key-Value config BackgroundColors
5. [button hcb_configBackgroundColors:@{@(UIControlStateNormal) : [UIColor redColor], @(UIControlStateSelected) : [UIColor blueColor]}];
```

## Remind
```objc
* ARC
* iOS>=6.0
```

## <a id="Hope"></a>Hope
* If you find bug when used，Hope you can Issues me，Thank you or try to download the latest code of this extension to see the BUG has been fixed or not
