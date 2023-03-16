//
//  ATFBannerTool.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>

@class ATBannerView;

NS_ASSUME_NONNULL_BEGIN

@interface ATFBannerTool : NSObject

#pragma mark - 工具类

/// 解析flutter端参数,获取bannerView的rect
+ (CGRect)getSizeFromExtraDic:(NSDictionary *)extraDic;

/// 获取BannerView
+ (ATBannerView *)getBannerViewAdRect:(CGRect)rect placementID:(NSString *)placementID sceneID:(NSString * _Nullable)sceneID;


/// 横幅广告是否准备好
+ (BOOL)bannerAdReady:(NSString *)placementID;

/// 获取当前广告位下所有可用广告的信息 v5.7.53及以上版本支持
+ (NSString *)getBannerValidAds:(NSString *)placementID;

/// 获取广告位的状态
+ (NSDictionary *)checkBannerLoadStatus:(NSString *)placementID;

@end

NS_ASSUME_NONNULL_END
