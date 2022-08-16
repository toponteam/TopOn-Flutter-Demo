import 'package:anythink_sdk/at_index.dart';
import '../topsize.dart';
import '../configuration_sdk.dart';

final BannerManager = BannerTool();

class BannerTool {
  loadBannerWith() async {
    await ATBannerManager.loadBannerAd(
        placementID: Configuration.bannerPlacementID,
        extraMap: {
          ATCommon.isNativeShow() : true,
          ATCommon.getAdSizeKey(): ATBannerManager.createLoadBannerAdSize(
              TopSize().getWidth(), TopSize().getWidth() * (50 / 320)),
          ATBannerManager.getAdaptiveWidthKey(): TopSize().getWidth(),
          ATBannerManager.getAdaptiveOrientationKey(): ATBannerManager.adaptiveOrientationCurrent(),
        }).then((value) {
      print('flutter End of banner loading');
    });
  }

  bannerAdReady() async {
    await ATBannerManager.bannerAdReady(
        placementID: Configuration.bannerPlacementID,

    ).then((value) {
      print('flutter bannerAdReady: $value');
    });
  }

  getBannerValidAds() async {
    await ATBannerManager.getBannerValidAds(
        placementID: Configuration.bannerPlacementID,

    ).then((value) {
      print('flutter getBannerValidAds: $value');
    });
  }

  checkBannerLoadStatus() async {
    await ATBannerManager.checkBannerLoadStatus(
        placementID: Configuration.bannerPlacementID,

    ).then((value) {
      print('flutter checkBannerLoadStatus: $value');
    });
  }


  showBannerInRectangle() async {
    await ATBannerManager.showBannerInRectangle(
        placementID: Configuration.bannerPlacementID,
        extraMap: {
          ATCommon.getAdSizeKey():
          ATBannerManager.createLoadBannerAdSize(400, 500, x: 0, y: 200),
        }).then((value) {
      print('flutter showBannerInRectangle: $value');
    });
  }

  showSceneBannerInRectangle() async {
    await ATBannerManager.showSceneBannerInRectangle(
        placementID: Configuration.bannerPlacementID,
        sceneID: Configuration.bannerSceneID,
        extraMap: {
          ATCommon.getAdSizeKey():
          ATBannerManager.createLoadBannerAdSize(400, 500, x: 0, y: 200),
        }).then((value) {
      print('flutter showSceneBannerInRectangle: $value');
    });
  }

  showAdInPosition() async {
    await ATBannerManager.showAdInPosition(
        placementID: Configuration.bannerPlacementID,
        position: ATCommon.getAdATBannerAdShowingPositionBottom())
        .then((value) {
      print('flutter showAdInPosition: $value');
    });
  }
  showSceneBannerAdInPosition() async {
    await ATBannerManager.showSceneBannerAdInPosition(
        placementID: Configuration.bannerPlacementID,
        sceneID: Configuration.bannerSceneID,
        position: ATCommon.getAdATBannerAdShowingPositionBottom())
        .then((value) {
      print('flutter showSceneBannerAdInPosition: $value');
    });
  }
  removeBannerAd() async {
    await ATBannerManager.removeBannerAd(
      placementID: Configuration.bannerPlacementID,
    ).then((value) {
      print('flutter removeBannerAd: $value');
    });
  }

  hideBannerAd() async {
    await ATBannerManager.hideBannerAd(
      placementID: Configuration.bannerPlacementID,
    ).then((value) {
      print('flutter hideBannerAd: $value');
    });
  }

  afreshShowBannerAd() async {
    await ATBannerManager.afreshShowBannerAd(
      placementID: Configuration.bannerPlacementID,
    ).then((value) {
      print('flutter afreshShowBannerAd: $value');
    });
  }

  readyStatus() async {
    await bannerAdReady();
    checkBannerLoadStatus();
    getBannerValidAds();
  }
}
