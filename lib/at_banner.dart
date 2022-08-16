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



  /*Use position and width and height attributes to display banner ads*/
  Future<String> showBannerInRectangle({
    required String placementID,
    required Map extraMap,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("showBannerInRectangle", {
      "placementID": placementID,
      "extraDic": extraMap,
    });
  }
  /*Use position and width and height attributes to display scene banner ads*/
  Future<String> showSceneBannerInRectangle({
    required String placementID,
    required String sceneID,
    required Map extraMap,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("showSceneBannerInRectangle", {
      "placementID": placementID,
      "sceneID": sceneID,
      "extraDic": extraMap,
    });
  }

  /*Use predefined positions to display banner ads*/
  Future<String> showAdInPosition({
    required String placementID,
    required String position,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("showAdInPosition", {
      "placementID": placementID,
      "position": position,
    });
  }
  /*Use pre-defined locations to display scene banner ads*/
  Future<String> showSceneBannerAdInPosition({
    required String placementID,
    required String position,
    required String sceneID,

  }) async {
    return await AnythinkSdk.channel.invokeMethod("showSceneBannerAdInPosition", {
      "placementID": placementID,
      "position": position,
      "sceneID": sceneID,
    });
  }


  /*Remove banner ads*/
  Future<String> removeBannerAd({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("removeBannerAd", {
      "placementID": placementID,
    });
  }

  /*Hide banner ads*/
  Future<String> hideBannerAd({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("hideBannerAd", {
      "placementID": placementID,
    });
  }

  /*Redisplay banner ads*/
  Future<String> afreshShowBannerAd({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("afreshShowBannerAd", {
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
