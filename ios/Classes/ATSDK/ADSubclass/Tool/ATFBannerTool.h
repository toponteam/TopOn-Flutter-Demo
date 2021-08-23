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
@end

NS_ASSUME_NONNULL_END
