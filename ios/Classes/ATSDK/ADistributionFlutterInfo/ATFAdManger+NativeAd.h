//
//  ATFAdManger+NativeAd.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFAdManger.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATFAdManger (NativeAd)

- (void)nativeAdFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result;

@end

NS_ASSUME_NONNULL_END
