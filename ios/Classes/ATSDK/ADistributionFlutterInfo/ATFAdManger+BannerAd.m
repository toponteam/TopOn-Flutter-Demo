//
//  ATFAdManger+BannerAd.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFAdManger+BannerAd.h"
#import "ATFConfiguration.h"
#import "ATFBannerTool.h"
NSString *const kATBannerPresentModalViewControllerNotification = @"";
NSString *const kATBannerNotificationUserInfoRequestIDKey = @"";
NSString *const kATBannerDismissModalViewControllerNotification = @"";
@implementation ATFAdManger (BannerAd)

- (void)bannerAdFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result{
    
    NSString *placementID = call.arguments[@"placementID"];
    NSDictionary *extraDic = call.arguments[@"extraDic"];
    NSString *sceneID = call.arguments[@"sceneID"];
    
    BOOL isNativeShowType = NO;
    
    if ([extraDic.allKeys containsObject:@"isNativeShowType"] && [extraDic[@"isNativeShowType"] boolValue] == YES) {
        isNativeShowType = YES;
    }
    
    ATFLog(@"Banner ad slot:%@",placementID);
    // 加载横幅广告
    if ([LoadBannerAd isEqualToString:call.method]) {
        
        
        if (isNativeShowType == NO) {
            [self.platfromBannerManger loadBannerWith:placementID extraDic:extraDic];
        }else{
            [self.bannerManger loadBannerWith:placementID extraDic:extraDic];
        }        
    }
    
    // 是否有广告缓存
    else if ([BannerAdReady isEqualToString:call.method]) {
        
        
        BOOL isReady = [ATFBannerTool bannerAdReady:placementID];
        result(@(isReady));
    }
    // 获取广告位的状态
    else if ([CheckBannerLoadStatus isEqualToString:call.method]) {
        
        NSDictionary *dic = [ATFBannerTool checkBannerLoadStatus:placementID];
        
        result(dic);
    }
    
    // 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
    else if ([GetBannerValidAds isEqualToString:call.method]) {
        
        NSString *str = [ATFBannerTool getBannerValidAds:placementID];
        result(str);
    }

    // 用位置和宽高属性来展示横幅广告
    else if ([ShowBannerInRectangle isEqualToString:call.method]) {
        
        [self.bannerManger showBannerInRectangle:placementID extraDic:extraDic];
    }
    // 用位置和宽高属性来展示横幅场景广告
    else if ([ShowSceneBannerInRectangle isEqualToString:call.method]) {
        
        if (sceneID == nil || sceneID.length == 0) {
            [self.bannerManger showBannerInRectangle:placementID extraDic:extraDic];
        }else{
            [self.bannerManger showBannerInRectangle:placementID sceneID:sceneID extraDic:extraDic];
        }
    }
    
    // 用预定义的位置来展示横幅广告
    else if ([ShowAdInPosition isEqualToString:call.method]) {
        
        NSString *position = call.arguments[@"position"];
        
        if (position.length == 0 || position == nil) {
            position = @"kATBannerAdShowingPositionBottom";
        }
        
        [self.bannerManger showAdInPosition:placementID position:position];         
    }
    
    // 用预定义的位置来展示场景横幅广告
    else if ([ShowSceneBannerAdInPosition isEqualToString:call.method]) {
        
        NSString *position = call.arguments[@"position"];
        
        if (position.length == 0 || position == nil) {
            position = @"kATBannerAdShowingPositionBottom";
        }
        
        if (sceneID == nil || sceneID.length == 0) {
            [self.bannerManger showAdInPosition:placementID position:position];
        }else{
            [self.bannerManger showAdInPosition:placementID sceneID:sceneID position:position];
        }
        
    }
    
    
    
    // 移除横幅广告
    else if ([RemoveBannerAd isEqualToString:call.method]) {
         [self.bannerManger removeBannerAd:placementID];
    }
    
    // 隐藏横幅广告
    else if ([HideBannerAd isEqualToString:call.method] ) {
         [self.bannerManger hideBannerAd:placementID];
    }
    
    // 重新展示横幅广告
    else if ([AfreshShowBannerAd isEqualToString:call.method]) {
         [self.bannerManger afreshShowBannerAd:placementID];
    }
     
     
    
}


@end
