//
//  ATFInterstitialManger.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/28.
//

#import "ATFInterstitialManger.h"
#import <AnyThinkInterstitial/AnyThinkInterstitial.h>
#import "ATFCommonTool.h"
#import "ATFInterstitialDelegate.h"


#define UseRewardedVideoAsInterstitialKey @"UseRewardedVideoAsInterstitialKey"
#define ATFInterstitialExtraAdSizeKey @"size"

@interface ATFInterstitialManger()

@property(nonatomic, strong) ATFInterstitialDelegate *interstitialDelegate;



@end

@implementation ATFInterstitialManger

#pragma mark - public
/// 加载插屏广告
- (void)loadInterstitialAd:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:extraDic];

    // 激励视频当做插屏使用（调用Sigmob的激励视频API）
    if ([extraDic.allKeys containsObject:UseRewardedVideoAsInterstitialKey]) {
        [dic removeObjectForKey:UseRewardedVideoAsInterstitialKey];
        dic[kATInterstitialExtraUsesRewardedVideo] = extraDic[UseRewardedVideoAsInterstitialKey];
    }
    
    // 可通过以下代码设置穿山甲平台的插屏图片广告的尺寸
    if ([extraDic.allKeys containsObject:ATFInterstitialExtraAdSizeKey]) {
        
        [dic removeObjectForKey:ATFInterstitialExtraAdSizeKey];
        
        NSDictionary *tempDic = extraDic[ATFInterstitialExtraAdSizeKey];
        
        NSNumber *widthNumeber = tempDic[@"width"];
       NSNumber *heightNumeber = tempDic[@"height"];

        CGSize tempSize = CGSizeMake([widthNumeber doubleValue], [heightNumeber doubleValue]);
        
        dic[kATInterstitialExtraAdSizeKey] = [NSValue valueWithCGSize:tempSize];
    }
    
    [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:dic delegate:self.interstitialDelegate];
}

/// 插屏广告是否准备好
- (BOOL)hasInterstitialAdReady:(NSString *)placementID{
    
    BOOL isReady = [[ATAdManager sharedManager] interstitialReadyForPlacementID:placementID];
    return  isReady;

}

/// 获取当前广告位下所有可用广告的信息
- (NSString *)getInterstitialValidAds:(NSString *)placementID{
    NSArray *array = [[ATAdManager sharedManager] getInterstitialValidAdsForPlacementID:placementID];
    
      NSString *str = [ATFCommonTool toReadableJSONString:array];
      
      return str;
}

/// 获取广告位的状态
- (NSDictionary *)checkInterstitialLoadStatus:(NSString *)placementID{
    ATCheckLoadModel *checkLoadModel = [[ATAdManager sharedManager] checkInterstitialLoadStatusForPlacementID:placementID];

    NSDictionary *dic = [ATFCommonTool objectToJSONString:checkLoadModel];
    return  dic;
}
/// 展示插屏广告
- (void)showInterstitialAd:(NSString *)placementID{
    [[ATAdManager sharedManager] showInterstitialWithPlacementID:placementID inViewController:[ATFCommonTool getCurrentViewController] delegate:self.interstitialDelegate];
}

/// 展示场景插屏广告
- (void)showInterstitialAd:(NSString *)placementID sceneID:(NSString *)sceneID{
    
        [[ATAdManager sharedManager] showInterstitialWithPlacementID:placementID scene:sceneID inViewController:[ATFCommonTool getCurrentViewController] delegate:self.interstitialDelegate];
}


#pragma mark - lazy
- (ATFInterstitialDelegate *)interstitialDelegate {

    if (_interstitialDelegate) return _interstitialDelegate;

    ATFInterstitialDelegate *interstitialDelegate = [ATFInterstitialDelegate new];

    return _interstitialDelegate = interstitialDelegate;
}
@end
