import 'dart:async';
import 'package:anythink_sdk/anythink_sdk.dart';

final ATBannerManager = ATBanner();

class ATBanner {
/*Init */
  ATBanner() {}

/* Load banner ad */
  Future<String> loadBannerAd({
    required String placementID,
    required Map extraMap,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("loadBannerAd", {
      "placementID": placementID,
      "extraDic": extraMap,
    });
  }

  Map createLoadBannerAdSize(double width, double height,
      {double x = 0, double y = 0}) {
    return {
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    };
  }

  /*Whether there is ad cache */
  Future<bool> bannerAdReady({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("bannerAdReady", {
      "placementID": placementID,
    });
  }

  /*Check ad status */
  Future<Map> checkBannerLoadStatus({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("checkBannerLoadStatus", {
      "placementID": placementID,
    });
  }

  /*Get information about all available ads in the current ad slot, supported by v5.7.53 and above */
  Future<String> getBannerValidAds({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("getBannerValidAds", {
      "placementID": placementID,
    });
  }

  String getAdaptiveWidthKey(){
    return 'adaptive_width';
  }

  String getAdaptiveOrientationKey(){
    return 'adaptive_orientation';
  }

  int adaptiveOrientationCurrent() {
    return 0;
  }

  int adaptiveOrientationPortrait() {
    return 1;
  }

  int adaptiveOrientationLandscape() {
    return 2;
  }


}
