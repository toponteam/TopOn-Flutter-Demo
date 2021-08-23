//
//  ATFAdManger.h
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/25.
//

#import <Foundation/Foundation.h>

#import <Flutter/Flutter.h>

#import "ATFInterstitialManger.h"

#import "ATFRewardedVideoManger.h"

#import "ATFBannerManger.h"

#import "ATFNativeManger.h"

#import "ATFPlatfromBannerManger.h"

#import "ATFPlatfromNativeManger.h"

#define ATFManger [ATAPI sharedInstance]

NS_ASSUME_NONNULL_BEGIN

@interface ATFAdManger : NSObject


/// 用来分发flutter传过来的方法调用
- (void)distributionFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result;

@property(nonatomic, strong) ATFRewardedVideoManger *rewardedVideoManger;

@property(nonatomic, strong) ATFInterstitialManger *interstitialManger;

@property(nonatomic, strong) ATFBannerManger *bannerManger;

@property(nonatomic, strong) ATFNativeManger *nativeManger;

@property(nonatomic, strong) ATFPlatfromBannerManger *platfromBannerManger;

@property(nonatomic, strong) ATFPlatfromNativeManger *platfromNativeManger;




@end

NS_ASSUME_NONNULL_END
