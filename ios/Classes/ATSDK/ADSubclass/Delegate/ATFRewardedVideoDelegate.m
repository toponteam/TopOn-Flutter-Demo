//
//  ATFRewardedVideoDelegate.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/13.
//

#import "ATFRewardedVideoDelegate.h"
#import "ATFCommonTool.h"
#import "ATFSendSignalManger.h"
#import "ATFConfiguration.h"
#import "ATFDisposeDataTool.h"


#define RewardedVideoCallName  @"RewardedVideoCall"


#define RewardedVideoDidFinishLoading  @"rewardedVideoDidFinishLoading"
#define RewardedVideoDidFailToLoad  @"rewardedVideoDidFailToLoad"
#define RewardedVideoDidStartPlaying  @"rewardedVideoDidStartPlaying"
#define RewardedVideoDidEndPlaying  @"rewardedVideoDidEndPlaying"
#define RewardedVideoDidFailToLoad  @"rewardedVideoDidFailToLoad"
#define RewardedVideoDidRewardSuccess  @"rewardedVideoDidRewardSuccess"
#define RewardedVideoDidClick  @"rewardedVideoDidClick"
#define RewardedVideoDidClose  @"rewardedVideoDidClose"
#define RewardedVideoDidDeepLink  @"rewardedVideoDidDeepLink"
#define RewardedVideoDidAgainStartPlaying  @"rewardedVideoDidAgainStartPlaying"
#define RewardedVideoDidAgainEndPlaying  @"rewardedVideoDidAgainEndPlaying"
#define RewardedVideoDidAgainFailToPlay  @"rewardedVideoDidAgainFailToPlay"
#define RewardedVideoDidAgainClick  @"rewardedVideoDidAgainClick"
#define RewardedVideoDidAgainRewardSuccess  @"rewardedVideoDidAgainRewardSuccess"


@implementation ATFRewardedVideoDelegate

#pragma mark - ATRewardedVideoDelegate
// 激励视频广告加载成功
- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
    
   NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidFinishLoading placementID:placementID extraDic:nil];

    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video ad loaded successfully");
}

// 激励视频广告加载失败
- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:RewardedVideoDidFailToLoad placementID:placementID extraDic:nil error:error];

    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video failed to load%@",error);
}

// 激励视频广告播放开始
- (void)rewardedVideoDidStartPlayingForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidStartPlaying placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video ad playback starts");
}

// 激励视频广告播放结束
- (void)rewardedVideoDidEndPlayingForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidEndPlaying placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video ad playing ends");
}

// 激励视频广告播放失败
- (void)rewardedVideoDidFailToPlayForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:RewardedVideoDidFailToLoad placementID:placementID extraDic:extra error:error];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video ad failed to play");
}

// 激励视频广告奖励下发
- (void)rewardedVideoDidRewardSuccessForPlacemenID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidRewardSuccess placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Incentive video ad rewards issuance");
}

// 激励视频广告点击
- (void)rewardedVideoDidClickForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidClick placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video ad clicks");
}

// 激励视频广告关闭
- (void)rewardedVideoDidCloseForPlacementID:(NSString *)placementID rewarded:(BOOL)rewarded extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidClose placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video ads closed");
}

// 激励视频广告点击跳转是否为Deeplink形式，目前只针对TopOn Adx的广告返回
- (void)rewardedVideoDidDeepLinkOrJumpForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
    
    NSMutableDictionary *dic  = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidDeepLink placementID:placementID extraDic:extra];
    dic[DeepLink] = @(success);
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Whether the click and jump of rewarded video ads is in the form of Deeplink");
}

// 激励视频再看一次广告播放开始
- (void)rewardedVideoAgainDidStartPlayingForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidAgainStartPlaying placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video again ad playback starts");
}

// 激励视频再看一次广告播放结束
- (void)rewardedVideoAgainDidEndPlayingForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidAgainEndPlaying placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video again ad playing ends");
}

// 激励视频再看一次广告播放失败
- (void)rewardedVideoAgainDidFailToPlayForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidAgainFailToPlay placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video again ad failed to play");
}

// 激励视频再看一次广告点击
- (void)rewardedVideoAgainDidClickForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidAgainClick placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video again ad clicks");
}

// 激励视频再看一次广告奖励下发
- (void)rewardedVideoAgainDidRewardSuccessForPlacemenID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:RewardedVideoDidAgainRewardSuccess placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: RewardedVideoCallName arguments:dic result:nil];
    ATFLog(@"Rewarded video again ad rewards issuance");
}


@end
