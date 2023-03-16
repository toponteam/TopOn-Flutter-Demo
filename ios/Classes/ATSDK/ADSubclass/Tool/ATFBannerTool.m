//
//  ATFBannerTool.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFBannerTool.h"
#import "ATFCommonTool.h"
#import <AnyThinkBanner/AnyThinkBanner.h>

#define ATFBannerAdLoadingExtraBannerAdSizeStruct  @"size"

@implementation ATFBannerTool
/// 解析flutter端参数,获取bannerView的rect
+ (CGRect)getSizeFromExtraDic:(NSDictionary *)extraDic{
    
    NSNumber *widthNumeber = [NSNumber numberWithDouble:[ATFCommonTool getRootViewController].view.frame.size.width];
    NSNumber *heightNumeber = [NSNumber numberWithDouble:250.f];
    
    NSNumber *x = [NSNumber numberWithDouble:0.0f];
    
    NSNumber *y = [NSNumber numberWithDouble:0.0f];

    if ([extraDic.allKeys containsObject:ATFBannerAdLoadingExtraBannerAdSizeStruct] &&extraDic[ATFBannerAdLoadingExtraBannerAdSizeStruct][@"width"] != nil ) {
        
        x = extraDic[ATFBannerAdLoadingExtraBannerAdSizeStruct][@"x"];
        y = extraDic[ATFBannerAdLoadingExtraBannerAdSizeStruct][@"y"];
        widthNumeber = extraDic[ATFBannerAdLoadingExtraBannerAdSizeStruct][@"width"];
        heightNumeber = extraDic[ATFBannerAdLoadingExtraBannerAdSizeStruct][@"height"];
    }
    
    return  CGRectMake([x doubleValue], [y doubleValue], [widthNumeber doubleValue], [heightNumeber doubleValue]);
}


/// 获取BannerView
+ (ATBannerView *)getBannerViewAdRect:(CGRect)rect placementID:(NSString *)placementID sceneID:(NSString * _Nullable)sceneID{
    
    ATBannerView *bannerView;
    
    if(sceneID.length != 0 || sceneID != nil){
        bannerView = [[ATAdManager sharedManager] retrieveBannerViewForPlacementID:placementID scene:sceneID];
    }else{
        bannerView = [[ATAdManager sharedManager] retrieveBannerViewForPlacementID:placementID];
    }
    bannerView.frame = rect;
    
    return  bannerView;
    
}


/// 横幅广告是否准备好
+ (BOOL)bannerAdReady:(NSString *)placementID{
    
    BOOL isReady =[[ATAdManager sharedManager] bannerAdReadyForPlacementID:placementID];
    return  isReady;
}

/// 获取当前广告位下所有可用广告的信息
+ (NSString *)getBannerValidAds:(NSString *)placementID{
    
    NSArray *array = [[ATAdManager sharedManager] getBannerValidAdsForPlacementID:placementID];
      NSString *str = [ATFCommonTool toReadableJSONString:array];
      return str;
}


/// 获取广告位的状态
+ (NSDictionary *)checkBannerLoadStatus:(NSString *)placementID{
    
    ATCheckLoadModel *model = [[ATAdManager sharedManager] checkBannerLoadStatusForPlacementID:placementID];
    
    NSDictionary *dic = [ATFCommonTool objectToJSONString:model];
    return  dic;
}



@end
