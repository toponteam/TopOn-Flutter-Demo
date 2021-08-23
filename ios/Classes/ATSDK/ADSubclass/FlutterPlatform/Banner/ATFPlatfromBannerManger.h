//
//  ATFPlatfromBannerManger.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFPlatfromBannerManger : NSObject

#pragma mark - flutter api
/// 加载横幅广告
- (void)loadBannerWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic;

/// 横幅广告是否准备好
- (BOOL)bannerAdReady:(NSString *)placementID;

/// 获取当前广告位下所有可用广告的信息 v5.7.53及以上版本支持
- (NSString *)getBannerValidAds:(NSString *)placementID;

/// 获取广告位的状态
- (NSDictionary *)checkBannerLoadStatus:(NSString *)placementID;

@end

NS_ASSUME_NONNULL_END
