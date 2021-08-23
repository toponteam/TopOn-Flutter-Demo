//
//  ATFInterstitialManger.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFInterstitialManger : NSObject
/// 加载插屏广告
- (void)loadInterstitialAd:(NSString *)placementID extraDic:(NSDictionary *)extraDic;

/// 插屏广告是否准备好
- (BOOL)hasInterstitialAdReady:(NSString *)placementID;

/// 获取当前广告位下所有可用广告的信息 v5.7.53及以上版本支持
- (NSString *)getInterstitialValidAds:(NSString *)placementID;

/// 获取广告位的状态
- (NSDictionary *)checkInterstitialLoadStatus:(NSString *)placementID;

/// 展示插屏广告
- (void)showInterstitialAd:(NSString *)placementID;

/// 展示场景插屏广告
- (void)showInterstitialAd:(NSString *)placementID sceneID:(NSString *)sceneID;

@end

NS_ASSUME_NONNULL_END
