//
//  ATFNativeTool.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>
#import <AnyThinkNative/AnyThinkNative.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFNativeTool : NSObject

+ (ATNativeADConfiguration *)getATNativeADConfiguration:(NSDictionary *)extraDic;

/// 原生广告是否准备好
+ (BOOL)nativeAdReady:(NSString *)placementID;

/// 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
+ (NSString *)getNativeValidAds:(NSString *)placementID;

/// 获取原生广告位的状态
+ (NSDictionary *)checkNativeLoadStatus:(NSString *)placementID;

@end

NS_ASSUME_NONNULL_END
