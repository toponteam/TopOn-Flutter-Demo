//
//  ATFNativeManger.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFNativeManger : NSObject
/// 加载原生广告
- (void)loadNativeWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic;

/// 展示原生广告
- (void)showNative:(NSString *)placementID isAdaptiveHeight:(BOOL)isAdaptiveHeight extraDic:(NSDictionary *) extraDic;

/// 展示场景原生广告
- (void)showNative:(NSString *)placementID sceneID:(NSString *)sceneID isAdaptiveHeight:(BOOL)isAdaptiveHeight extraDic:(NSDictionary *) extraDic;

/// 移除原生广告
- (void)removeNative:(NSString *)placementID;

@end

NS_ASSUME_NONNULL_END
