//
//  ATFInterstitialDelegate.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/13.
//

#import "ATFInterstitialDelegate.h"
#import "ATFCommonTool.h"
#import "ATFSendSignalManger.h"
#import "ATFConfiguration.h"
#import "ATFDisposeDataTool.h"

#define InterstitialCallName  @"InterstitialCall"


#define InterstitialAdFailToLoadAD  @"interstitialAdFailToLoadAD"
#define InterstitialAdDidFinishLoading  @"interstitialAdDidFinishLoading"
#define InterstitialAdDidDeepLink  @"interstitialAdDidDeepLink"
#define InterstitialAdDidClick  @"interstitialAdDidClick"
#define InterstitialAdDidClose  @"interstitialAdDidClose"
#define InterstitialAdDidStartPlaying  @"interstitialAdDidStartPlaying"
#define InterstitialAdDidEndPlaying  @"interstitialAdDidEndPlaying"
#define InterstitialDidFailToPlayVideo  @"interstitialDidFailToPlayVideo"
#define InterstitialDidShowSucceed  @"interstitialDidShowSucceed"
#define InterstitialFailedToShow  @"interstitialFailedToShow"

@implementation ATFInterstitialDelegate

#pragma mark - ATInterstitialDelegate

// 插屏广告加载失败
- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:InterstitialAdFailToLoadAD placementID:placementID extraDic:nil error:error];

    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ads failed to load%@",error);
}


// 插屏广告加载成功
- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSMutableDictionary *dic =  [ATFDisposeDataTool revampSucceedCallDic:InterstitialAdDidFinishLoading placementID:placementID extraDic:nil];

    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ads loaded successfully");
}

// 插屏广告点击跳转是否为Deeplink形式，目前只针对TopOn Adx的广告返回
- (void)interstitialDeepLinkOrJumpForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:InterstitialAdDidDeepLink placementID:placementID extraDic:extra];
    dic[DeepLink] = @(success);

    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Is the interstitial ad click to jump in the form of Deeplink?");
}

// 插屏广告点击
- (void)interstitialDidClickForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
        
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:InterstitialAdDidClick placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ad click");
    
}

// 插屏广告关闭
- (void)interstitialDidCloseForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:InterstitialAdDidClose placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ads off");
    
}
// 插屏视频广告播放开始
- (void)interstitialDidStartPlayingVideoForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:InterstitialAdDidStartPlaying placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ad playback starts");
}
// 插屏视频广告播放结束
- (void)interstitialDidEndPlayingVideoForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:InterstitialAdDidEndPlaying placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial video ad playing ends");
}
// 插屏视频广告播放失败
- (void)interstitialDidFailToPlayVideoForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:InterstitialDidFailToPlayVideo placementID:placementID extraDic:extra error:error];
    
    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial video ad failed to play");
    
}
// 插屏广告展示成功
- (void)interstitialDidShowForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:InterstitialDidShowSucceed placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ads displayed successfully");
    
}
// 插屏广告展示失败
- (void)interstitialFailedToShowForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:InterstitialFailedToShow placementID:placementID extraDic:extra error:error];
    
    [SendEventManger sendMethod: InterstitialCallName arguments:dic result:nil];
    ATFLog(@"Interstitial ad failed to display");
    
}
@end
