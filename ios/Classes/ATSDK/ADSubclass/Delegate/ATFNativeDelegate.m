//
//  ATFNativeDelegate.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFNativeDelegate.h"
#import "ATFSendSignalManger.h"
#import "ATFDisposeDataTool.h"
#import "ATFConfiguration.h"

#define NativeCallName  @"NativeCall"

#define NativeAdFailToLoadAD  @"nativeAdFailToLoadAD"
#define NativeAdDidFinishLoading  @"nativeAdDidFinishLoading"
#define NativeAddidClick  @"nativeAdDidClick"
#define NativeAdDidDeepLink  @"nativeAdDidDeepLink"
#define NativeAddidEndPlayingVideo  @"nativeAdDidEndPlayingVideo"
#define NativeAdEnterFullScreenVideo  @"nativeAdEnterFullScreenVideo"
#define NativeAdExitFullScreenVideoInAd  @"nativeAdExitFullScreenVideoInAd"
#define NativeAddidShowNativeAd  @"nativeAdDidShowNativeAd"
#define NativeAddidStartPlayingVideo  @"nativeAdDidStartPlayingVideo"
#define NativeAddidTapCloseButton  @"nativeAdDidTapCloseButton"
#define NativeAdDidCloseDetailInAdView  @"nativeAdDidCloseDetailInAdView"

#define NativeAddidLoadSuccessDraw  @"nativeAdDidLoadSuccessDraw"
@implementation ATFNativeDelegate

#pragma mark - ATNativeADDelegate
// 广告加载失败
- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:NativeAdFailToLoadAD placementID:placementID extraDic:nil error:error];
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];

    ATFLog(@"Native ads failed to load%@",error);
}
// 广告加载成功
- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
    
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic: NativeAdDidFinishLoading placementID:placementID extraDic:nil];

    [SendEventManger sendMethod:NativeCallName arguments:dic result:nil];
    ATFLog(@"Native ads loaded successfully");
}
// 广告点击
- (void)didClickNativeAdInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidClick placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    
    ATFLog(@"Native ad click");
}
// 广告点击跳转是否为Deeplink形式，目前只针对TopOn Adx的广告返回
- (void)didDeepLinkOrJumpInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdDidDeepLink placementID:placementID extraDic:extra];
    dic[DeepLink] = @(success);
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"Whether the native ad click to jump is in the form of Deeplink");

}
// 广告视频结束播放，部分广告平台有此回调
- (void)didEndPlayingVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidEndPlayingVideo placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"Native ad video ends playing, some ad platforms have this callback");

}
// 广告进入全屏播放
- (void)didEnterFullScreenVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdEnterFullScreenVideo placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"Native ads enter full-screen playback");

}
// 离开全屏播放
- (void)didExitFullScreenVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdExitFullScreenVideoInAd placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
    ATFLog(@"Native ads leave full-screen playback");

}

// 广告展示成功
- (void)didShowNativeAdInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidShowNativeAd placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
    ATFLog(@"Native ads displayed successfully");

}
// 广告视频开始播放，部分广告平台有此回调
- (void)didStartPlayingVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidStartPlayingVideo placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
    ATFLog(@"Native advertising video starts to play, some advertising platforms have this callback");

}
// 广告关闭按钮被点击，部分广告平台有此回调
- (void)didTapCloseButtonInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidTapCloseButton placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"The native ad close button is clicked, some ad platforms have this callback");

}

- (void)didLoadSuccessDrawWith:(NSArray *)views placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidLoadSuccessDraw placementID:placementID extraDic:extra];
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"Native ads loaded Draw successfully");
}

- (void)didCloseDetailInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdDidCloseDetailInAdView placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"Native advertising details are closed, some advertising platforms have this callback");
    
}
@end
