//
//  ATFAdManger+BannerAd.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFAdManger.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATFAdManger (BannerAd)
extern NSString * const kATBannerPresentModalViewControllerNotification;
extern NSString * const kATBannerNotificationUserInfoRequestIDKey;
extern NSString * const kATBannerDismissModalViewControllerNotification;

- (void)bannerAdFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result;




@end

NS_ASSUME_NONNULL_END
