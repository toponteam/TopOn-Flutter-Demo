//
//  ATFContainerTool.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/25.
//

#import "ATFCommonTool.h"
#import "ATFConfiguration.h"

@implementation ATFCommonTool

+ (UIViewController *)currentViewController{
    
    UIWindow *keyWindow  = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;
    while (vc.presentedViewController)
    {
        vc = vc.presentedViewController;
        
        if ([vc isKindOfClass:[UINavigationController class]])
        {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        else if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
}
+ (UIViewController *)getCurrentViewController{
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    UIViewController *parent = rootVC;
    while((parent = rootVC.presentingViewController) != nil){
        rootVC = parent;
    }
    
    while ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC topViewController];
    }
    
    return rootVC;
}

+ (UIViewController *)getRootViewController{
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    NSAssert(window, @"The window is empty");
    return window.rootViewController;
}

//json格式字符串转字典：

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        ATFLog(@"json parsing failed：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

//字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    if (dic == nil || dic.count == 0) {
        return @"No ad cache information with the highest priority";
    }
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];

    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

// 数组转字符串
+ (NSString *)toReadableJSONString:(NSArray *)dataArr {
    
    if (dataArr == nil || dataArr.count == 0) {
        return @"There is no information for available ads under the AD space";
    }
    
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataArr
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

+ (NSDictionary *)objectToJSONString:(ATCheckLoadModel *)mode{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[@"isLoading"] = [NSString stringWithFormat:@"%d",mode.isLoading];
    dic[@"isReady"] = [NSString stringWithFormat:@"%d",mode.isReady];
    dic[@"adInfo"] = mode.adOfferInfo;
    return dic;
}

+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha
{
    int red, green, blue;
    blue = hex & 0x0000FF;
    green = ((hex & 0x00FF00) >> 8);
    red = ((hex & 0xFF0000) >> 16);
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

//字符串转颜色
+ (UIColor *)colorWithHexString:(NSString *)HexString
{
    if ([HexString isEqualToString:@"clearColor"]) {
        return [UIColor clearColor];
    }
    
    NSString *cString = [[HexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return [UIColor whiteColor];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)HexString alpha:(CGFloat)alpha{
    NSString *cString = [[HexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return [UIColor whiteColor];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta {
    CGFloat hue = 0.0f;
    CGFloat saturation = 0.0f;
    CGFloat brightness = 0.0f;
    CGFloat alpha = 0.0f;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    brightness += delta;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta {
    CGFloat hue = 0.0f;
    CGFloat saturation = 0.0f;
    CGFloat brightness = 0.0f;
    CGFloat alpha = 0.0f;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    alpha += delta;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}
+ (UIColor*) colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0];
}
@end
