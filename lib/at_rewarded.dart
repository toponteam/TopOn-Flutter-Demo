import 'dart:async';

import 'package:anythink_sdk/anythink_sdk.dart';

final ATRewardedManager = ATRewarded();

class ATRewarded{

/*Initialization */
  ATRewarded(){}


/*Load rewarded video ad */
  Future<String> loadRewardedVideo({
    required String placementID,
    required Map extraMap,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("loadRewardedVideo", {
      "placementID": placementID,
      "extraDic": extraMap,
    });
  }

  String kATAdLoadingExtraMediaExtraKey(){
    return 'kATAdLoadingExtraMediaExtraKey';
  }
  String kATAdLoadingExtraUserIDKey(){
    return 'kATAdLoadingExtraUserIDKey';
  }


  /*Show rewarded video ad */
  Future<String> showRewardedVideo({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("showRewardedVideo", {
      "placementID": placementID,
    });
  }

  /*Showcase rewarded video ad */
  Future<String> showSceneRewardedVideo({
    required String placementID,
    required String sceneID,

  }) async {
    return await AnythinkSdk.channel.invokeMethod("showSceneRewardedVideo", {
      "placementID": placementID,
      "sceneID": sceneID,
    });
  }

/*Whether there is ad cache */
  Future<bool> rewardedVideoReady({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("rewardedVideoReady", {
      "placementID": placementID,
    });
  }

/*Check ad status */
  Future<Map> checkRewardedVideoLoadStatus({
    required String placementID,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("checkRewardedVideoLoadStatus", {
      "placementID": placementID,
    });
  }

/*Get information about all available ads in the current ad slot, supported by v 5.7.53 and above */
Future<String> getRewardedVideoValidAds({
  required String placementID,
}) async {
  return await AnythinkSdk.channel.invokeMethod("getRewardedVideoValidAds", {
    "placementID": placementID,
  });
}
}
