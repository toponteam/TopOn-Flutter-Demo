//
//  ATFContainerTool.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import <AnyThinkSDK/ATCheckLoadModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface ATFCommonTool : NSObject

+ (UIViewController *)currentViewController;

+ (UIViewController *)getRootViewController;

+ (UIViewController *)getCurrentViewController;

+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSString *)toReadableJSONString:(NSArray *)dataArr;

+ (NSDictionary *)objectToJSONString:(ATCheckLoadModel *)mode;
/**
 *  十六进制字符串转颜色
 */
+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)HexString;

+ (UIColor *)colorWithHexString:(NSString *)HexString alpha:(CGFloat)alpha;

+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;

+ (UIColor*) colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;

+ (UIColor*) colorWithHex:(NSInteger)hexValue;

@end

NS_ASSUME_NONNULL_END
