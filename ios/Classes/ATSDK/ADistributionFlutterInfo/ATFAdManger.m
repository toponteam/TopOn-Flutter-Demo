//
//  ATFAdManger.m
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/25.
//

#import "ATFAdManger.h"
#import <AnyThinkSDK/AnyThinkSDK.h>
//iOS 14
#import <AppTrackingTransparency/AppTrackingTransparency.h>

#import "ATFAdManger+Initchannel.h"
#import "ATFDisposeDataTool.h"
#import "ATFAdManger+RewardedVideo.h"
#import "ATFAdManger+InterstitialAd.h"
#import "ATFAdManger+BannerAd.h"
#import "ATFConfiguration.h"
#import "ATFAdManger+NativeAd.h"

@interface ATFAdManger()


@property(nonatomic, strong) NSArray *funcRewardNameArray;

@property(nonatomic, strong) NSArray *funcinitNameArray;

@property(nonatomic, strong) NSArray *funcInterstitialNameArray;

@property(nonatomic, strong) NSArray *funcBannerNameArray;

@property(nonatomic, strong) NSArray *funcNativeNameArray;

@end

@implementation ATFAdManger


#pragma mark - public

- (void)distributionFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result{
    
    
    // 初始化方法调用
    if ([self.funcinitNameArray containsObject:call.method]) {
        // json to mode
        [ATFDisposeDataTool disposeInitData:call.arguments];

        [self initFlutterInformation:call result:result];
    }
    
    // 激励视频方法调用
    if ([self.funcRewardNameArray containsObject:call.method]) {

        [self rewardedVideoFlutterInformation:call result:result];
    }
    
    // 插屏广告方法调用
    if ([self.funcInterstitialNameArray containsObject:call.method]) {
        [self interstitialAdFlutterInformation:call result:result];
    }
    
    // 横幅广告调用
    if ([self.funcBannerNameArray containsObject:call.method]) {
        [self bannerAdFlutterInformation:call result:result];
    }
    
    // 原生广告调用
    if ([self.funcNativeNameArray containsObject:call.method]) {
        [self nativeAdFlutterInformation:call result:result];
    }
    
}

#pragma mark - lazy

- (NSArray *)funcinitNameArray{
    if (_funcinitNameArray == nil) {
        _funcinitNameArray = @[SetLogEnabled,SetChannelStr,SetSubchannelStr,SetCustomDataDic,SetExludeBundleIDArray,SetPlacementCustomData,InitAnyThinkSDK,GetGDPRLevel,GetUserLocation,ShowGDPRAuth,SetDataConsentSet,SetDeniedUploadInfoArray];
    }
    return _funcinitNameArray;
}


- (NSArray *)funcRewardNameArray{
    if (_funcRewardNameArray == nil) {
        _funcRewardNameArray = @[LoadRewardedVideo,RewardedVideoReady,CheckRewardedVideoLoadStatus,ShowRewardedVideo,GetRewardedVideoValidAds,ShowSceneRewardedVideo];
    }
    return _funcRewardNameArray;
}

- (NSArray *)funcInterstitialNameArray{
    if (_funcInterstitialNameArray == nil) {
        _funcInterstitialNameArray = @[LoadInterstitialAd,HasInterstitialAdReady,GetInterstitialValidAds,ShowInterstitialAd,CheckInterstitialLoadStatus,ShowSceneInterstitialAd];
    }
    return _funcInterstitialNameArray;
}

- (NSArray *)funcBannerNameArray{
    if (_funcBannerNameArray == nil) {
        _funcBannerNameArray = @[LoadBannerAd,BannerAdReady,CheckBannerLoadStatus,GetBannerValidAds,ShowBannerInRectangle,ShowAdInPosition,RemoveBannerAd,HideBannerAd,AfreshShowBannerAd,ShowSceneBannerAdInPosition,ShowSceneBannerInRectangle];
    }
    return _funcBannerNameArray;
}

- (NSArray *)funcNativeNameArray{
    if (_funcNativeNameArray == nil) {
        _funcNativeNameArray = @[NativeAdReady,CheckNativeAdLoadStatus,GetNativeValidAds,LoadNativeAd,ShowNativeAd,ShowSceneNativeAd,RemoveNativeAd];
    }
    return _funcNativeNameArray;
}

- (ATFRewardedVideoManger *)rewardedVideoManger {

    if (_rewardedVideoManger) return _rewardedVideoManger;

    ATFRewardedVideoManger *rewardedVideoManger = [ATFRewardedVideoManger new];

    return _rewardedVideoManger = rewardedVideoManger;
}

- (ATFInterstitialManger *)interstitialManger {

    if (_interstitialManger) return _interstitialManger;

    ATFInterstitialManger *interstitialAdManger = [ATFInterstitialManger new];

    return _interstitialManger = interstitialAdManger;
}

- (ATFBannerManger *)bannerManger {

    if (_bannerManger) return _bannerManger;

    ATFBannerManger *bannerManger = [ATFBannerManger new];

    return _bannerManger = bannerManger;
}

- (ATFPlatfromBannerManger *)platfromBannerManger {

    if (_platfromBannerManger) return _platfromBannerManger;

    ATFPlatfromBannerManger *platfromBannerManger = [ATFPlatfromBannerManger new];

    return _platfromBannerManger = platfromBannerManger;
}


- (ATFNativeManger *)nativeManger {

    if (_nativeManger) return _nativeManger;

    ATFNativeManger *nativeManger = [ATFNativeManger new];

    return _nativeManger = nativeManger;
}

- (ATFPlatfromNativeManger *)platfromNativeManger {

    if (_platfromNativeManger) return _platfromNativeManger;

    ATFPlatfromNativeManger *platfromNativeManger = [ATFPlatfromNativeManger new];

    return _platfromNativeManger = platfromNativeManger;
}

@end
