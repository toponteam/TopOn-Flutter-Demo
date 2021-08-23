//
//  ATFRewardedVideoManger.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFRewardedVideoManger : NSObject

/// 加载激励视频
- (void)loadRewardedVideo:(NSString *)placementID extraDic:(NSDictionary *)extraDic;

/// 是否有广告缓存
- (BOOL)rewardedVideoReady:(NSString *)placementID;

/// 检查广告状态
- (NSDictionary *)checkRewardedVideoLoadStatus:(NSString *)placementID;

/// 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
- (NSString *)getRewardedVideoValidAds:(NSString *)placementID;

/// 展示激励视频广告
- (void)showRewardedVideo:(NSString *)placementID;

///  展示场景激励视频广告
- (void)showRewardedVideo:(NSString *)placementID sceneID:(NSString *)sceneID;



@end

NS_ASSUME_NONNULL_END
