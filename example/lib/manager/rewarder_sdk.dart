import 'package:anythink_sdk/at_index.dart';
import '../configuration_sdk.dart';

final RewarderManager = RewarderTool();

class RewarderTool{

  loadRewardedVideo() async {
    await ATRewardedManager.loadRewardedVideo(
        placementID: Configuration.rewarderPlacementID,
        extraMap: {
          ATRewardedManager.kATAdLoadingExtraMediaExtraKey(): '1234',
          ATRewardedManager.kATAdLoadingExtraUserIDKey(): '1234',
        });
  }

  rewardVideocheck() async{
    rewardedVideoReady();
    checkRewardedVideoLoadStatus();
    getRewardedVideoValidAds();
  }

  rewardedVideoReady() async {
    await ATRewardedManager
        .rewardedVideoReady(
      placementID: Configuration.rewarderPlacementID,
    )
        .then((value) {
      print('flutter rewardedVideoReady: $value');
    });
  }

  checkRewardedVideoLoadStatus() async {
    await ATRewardedManager
        .checkRewardedVideoLoadStatus(
      placementID: Configuration.rewarderPlacementID,
    )
        .then((value) {
          print('flutter checkRewardedVideoLoadStatus: $value');
    });
  }

  getRewardedVideoValidAds() async {
    await ATRewardedManager.getRewardedVideoValidAds(
      placementID: Configuration.rewarderPlacementID,)
        .then((value) {
      print('flutter getRewardedVideoValidAds: $value');
    });
  }

  showRewardedVideo() async {
    await ATRewardedManager
        .showRewardedVideo(
      placementID: Configuration.rewarderPlacementID,
    );
  }

  showSceneRewardedAd() async {
    await ATRewardedManager
        .showSceneRewardedVideo(
      sceneID: Configuration.rewarderSceneID,
      placementID: Configuration.rewarderPlacementID,
    );
  }
}