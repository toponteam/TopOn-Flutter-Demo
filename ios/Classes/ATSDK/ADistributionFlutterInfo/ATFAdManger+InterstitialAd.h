//
//  ATFAdManger+InterstitialAd.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/28.
//

#import "ATFAdManger.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATFAdManger (InterstitialAd)

- (void)interstitialAdFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result;

@end

NS_ASSUME_NONNULL_END
