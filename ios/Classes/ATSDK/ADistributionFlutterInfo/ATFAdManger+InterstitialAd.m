//
//  ATFAdManger+InterstitialAd.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/28.
//

#import "ATFAdManger+InterstitialAd.h"
#import "ATFConfiguration.h"

@implementation ATFAdManger (InterstitialAd)

- (void)interstitialAdFlutterInformation:(FlutterMethodCall *)call result:(FlutterResult)result{
    
    
    NSString *placementID = call.arguments[@"placementID"];
    NSDictionary *extraDic = call.arguments[@"extraDic"];
    NSString *sceneID = call.arguments[@"sceneID"];

    ATFLog(@"Interstitial ad slot:%@",placementID);

    // 加载插屏广告
    if ([LoadInterstitialAd isEqualToString:call.method]) {
        
        [self.interstitialManger loadInterstitialAd:placementID extraDic:extraDic];
    }
    // 插屏广告是否准备好
    else if ([HasInterstitialAdReady isEqualToString:call.method]) {
        BOOL isReady =   [self.interstitialManger hasInterstitialAdReady:placementID];
        result(@(isReady));

    }
    // 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
    else if ([GetInterstitialValidAds isEqualToString:call.method]) {
        NSString *str = [self.interstitialManger getInterstitialValidAds:placementID];
        result(str);
    }
    
    // 获取广告位的状态
    else if ([CheckInterstitialLoadStatus isEqualToString:call.method]) {
        NSDictionary *dic = [self.interstitialManger checkInterstitialLoadStatus:placementID];
        result(dic);
    }
    
    // 展示插屏广告
    else if ([ShowInterstitialAd isEqualToString:call.method]) {
        [self.interstitialManger showInterstitialAd:placementID];
    }
    
    // 展示场景插屏广告
    else if ([ShowSceneInterstitialAd isEqualToString:call.method]) {
        
        if (sceneID == nil || sceneID.length == 0) {
            [self.interstitialManger showInterstitialAd:placementID];
        }else{
            [self.interstitialManger showInterstitialAd:placementID sceneID:sceneID];
        }
    }
    
    
    
}

@end
