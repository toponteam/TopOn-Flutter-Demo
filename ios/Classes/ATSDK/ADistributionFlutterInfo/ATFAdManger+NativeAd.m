//
//  ATFAdManger+NativeAd.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFAdManger+NativeAd.h"
#import "ATFConfiguration.h"

@implementation ATFAdManger (NativeAd)

- (void)nativeAdFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result{
    
    NSString *placementID = call.arguments[@"placementID"];
    NSDictionary *extraDic = call.arguments[@"extraDic"];
//    NSString *sceneID = call.arguments[@"sceneID"];

    ATFLog(@"Native ad slot:%@",placementID);

    // 加载原生广告
    if ([LoadNativeAd isEqualToString:call.method]) {

        [self.platfromNativeManger loadNativeWith:placementID extraDic:extraDic];
        
    }
    // 原生广告是否准备好
    else if ([NativeAdReady isEqualToString:call.method]) {
        BOOL isReady =   [self.platfromNativeManger nativeAdReady:placementID];
        result(@(isReady));

    }
    // 获取广告位的状态
    else if ([CheckNativeAdLoadStatus isEqualToString:call.method]) {
        NSDictionary *dic= [self.platfromNativeManger checkNativeLoadStatus:placementID];
        result(dic);
    }
    
    // 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
    else if ([GetNativeValidAds isEqualToString:call.method]) {
        NSString *str = [self.platfromNativeManger getNativeValidAds:placementID];
        result(str);
    }
    
   /*
    
    // 展示原生广告
    else if ([ShowNativeAd isEqualToString:call.method]) {
        [self.nativeManger showNative:placementID extraDic:extraDic];
    }
    // 展示场景原生广告
    else if ([ShowSceneNativeAd isEqualToString:call.method]) {
        
        if (sceneID == nil || sceneID.length == 0) {
            [self.nativeManger showNative:placementID extraDic:extraDic];
        }else{
            [self.nativeManger showNative:placementID sceneID:sceneID extraDic:extraDic];
        }

    }
     
    */
}
@end
