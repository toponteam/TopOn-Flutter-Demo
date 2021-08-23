import 'package:anythink_sdk/at_index.dart';
import '../topsize.dart';
import '../configuration_sdk.dart';

final BannerManager = BannerTool();

class BannerTool {
  loadBannerWith() async {
    await ATBannerManager.loadBannerAd(
        placementID: Configuration.bannerPlacementID,
        extraMap: {
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

  readyStatus() async {
    await bannerAdReady();
    checkBannerLoadStatus();
    getBannerValidAds();
  }
}
