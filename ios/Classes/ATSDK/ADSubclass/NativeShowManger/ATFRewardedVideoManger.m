//
//  ATFRewardedVideoManger.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/26.
//

#import "ATFRewardedVideoManger.h"
//#import <AnyThinkSDK/AnyThinkSDK.h>
#import <AnyThinkRewardedVideo/AnyThinkRewardedVideo.h>
#import "ATFCommonTool.h"
#import "ATFRewardedVideoDelegate.h"
#define kATAdLoadingExtraUserData  @"kATAdLoadingExtraMediaExtraKey"
#define kATAdLoadingExtraUserID  @"kATAdLoadingExtraUserIDKey"

@interface ATFRewardedVideoManger()

@property(nonatomic, strong) ATFRewardedVideoDelegate *rewardedVideoDelegate;



@end


@implementation ATFRewardedVideoManger

#pragma mark - public
/// 加载激励视频
- (void)loadRewardedVideo:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:extraDic];

    
    if ([extraDic.allKeys containsObject:kATAdLoadingExtraUserData]) {
        [dic removeObjectForKey:kATAdLoadingExtraUserData];
        dic[kATAdLoadingExtraMediaExtraKey] = extraDic[kATAdLoadingExtraUserData];
    }
    if ([extraDic.allKeys containsObject:kATAdLoadingExtraUserID]) {
        [dic removeObjectForKey:kATAdLoadingExtraUserID];
        dic[kATAdLoadingExtraUserIDKey] = extraDic[kATAdLoadingExtraUserID];
    }
    
    [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:dic delegate:self.rewardedVideoDelegate];
}


/// 展示激励视频广告
- (void)showRewardedVideo:(NSString *)placementID{
    
    [[ATAdManager sharedManager] showRewardedVideoWithPlacementID:placementID inViewController:[ATFCommonTool getCurrentViewController] delegate:self.rewardedVideoDelegate];
}

///  展示场景激励视频广告
- (void)showRewardedVideo:(NSString *)placementID sceneID:(NSString *)sceneID{
    
    [[ATAdManager sharedManager] showRewardedVideoWithPlacementID:placementID scene:sceneID inViewController:[ATFCommonTool getCurrentViewController] delegate:self.rewardedVideoDelegate];
}


/// 是否有广告缓存
- (BOOL)rewardedVideoReady:(NSString *)placementID{
    
    BOOL isReady = [[ATAdManager sharedManager] rewardedVideoReadyForPlacementID:placementID];
    return  isReady;
}

/// 检查广告状态
- (NSDictionary *)checkRewardedVideoLoadStatus:(NSString *)placementID{
    
    ATCheckLoadModel *checkLoadModel = [[ATAdManager sharedManager] checkRewardedVideoLoadStatusForPlacementID:placementID];

    NSDictionary *dic = [ATFCommonTool objectToJSONString:checkLoadModel];
    return  dic;
}

///  获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
- (NSString *)getRewardedVideoValidAds:(NSString *)placementID{
    
  NSArray *array = [[ATAdManager sharedManager] getRewardedVideoValidAdsForPlacementID:placementID];
    
    NSString *str = [ATFCommonTool toReadableJSONString:array];
    
    return str;
    
}

#pragma mark - lazy
- (ATFRewardedVideoDelegate *)rewardedVideoDelegate {

    if (_rewardedVideoDelegate) return _rewardedVideoDelegate;

    ATFRewardedVideoDelegate *rewardedVideoDelegate = [ATFRewardedVideoDelegate new];

    return _rewardedVideoDelegate = rewardedVideoDelegate;
}

@end
