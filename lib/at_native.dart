import 'dart:async';
import 'package:anythink_sdk/anythink_sdk.dart';

final ATNativeManager = ATNative();

class ATNative {
/*Initialization */
  ToponNative() {}

/*Load native ad */
  Future<String> loadNativeAd({
    required String placementID,
    required Map extraMap,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("loadNativeAd", {
      "placementID": placementID,
      "extraDic": extraMap,
    });
  }

  String parent() {
    return 'parent';
  }

  String appIcon() {
    return 'appIcon';
  }

  String mainImage() {
    return 'mainImage';
  }

  String mainTitle() {
    return 'title';
  }

  String desc() {
    return 'desc';
  }

  String adLogo() {
    return 'adLogo';
  }

  String cta() {
    return 'cta';
  }

  String dislike() {
    return 'dislike';
  }

  String isAdaptiveHeight() {
    return 'isAdaptiveHeight';
  }

  Map createNativeSubViewAttribute(double width, double height,
      {double x = 0,
      double y = 0,
      String backgroundColorStr = '#FFFFFF',
      String textColorStr = '#000000',
      double textSize = 15,
      bool isCustomClick = true}) {
    return {
      'x': x,
      'y': y,
      'width': width,
      'height': height,
      'backgroundColorStr': backgroundColorStr,
      'textColorStr': textColorStr,
      'textSize': textSize,
      'isCustomClick': isCustomClick,
    };
  }

  /*Whether there is ad cache*/
  Future<bool> nativeAdReady({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("nativeAdReady", {
      "placementID": placementID,
    });
  }

/*Check ad status */
  Future<Map> checkNativeAdLoadStatus({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("checkNativeAdLoadStatus", {
      "placementID": placementID,
    });
  }

/*Get information about all available ads in the current ad slot, supported by v 5.7.53 and above */
  Future<String> getNativeValidAds({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("getNativeValidAds", {
      "placementID": placementID,
    });
  }
}
