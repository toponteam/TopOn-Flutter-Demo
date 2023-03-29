import 'package:anythink_sdk/at_index.dart';
import '../configuration_sdk.dart';

final InterstitialManager = InterstitialTool();

class InterstitialTool {
  loadInterstitialAd() async {
    await ATInterstitialManager.loadInterstitialAd(
        placementID: Configuration.interstitialPlacementID,
        extraMap: {
          // Sigmob rewarded video ----> Interstitial ads
          // ATInterstitialManager.useRewardedVideoAsInterstitialKey(): true
        });
  }

  interstitialAdcheck() async {
    hasInterstitialAdReady();
    getInterstitialValidAds();
    checkInterstitialLoadStatus();
  }

  hasInterstitialAdReady() async {
    await ATInterstitialManager.hasInterstitialAdReady(
      placementID: Configuration.interstitialPlacementID,
    ).then((value) {
      print('flutter hasInterstitialAdReady: $value');
    });
  }

  getInterstitialValidAds() async {
    await ATInterstitialManager.getInterstitialValidAds(
      placementID: Configuration.interstitialPlacementID,
    ).then((value) {
      print('flutter getInterstitialValidAds: $value');
    });
  }

  checkInterstitialLoadStatus() async {
    await ATInterstitialManager.checkInterstitialLoadStatus(
      placementID: Configuration.interstitialPlacementID,
    ).then((value) {
      print('flutter checkInterstitialLoadStatus: $value');
    });
  }

  showInterstitialAd() async {
    await ATInterstitialManager.showInterstitialAd(
      placementID: Configuration.interstitialPlacementID,
    );
  }

  showSceneInterstitialAd() async {
    await ATInterstitialManager.showSceneInterstitialAd(
      placementID: Configuration.interstitialPlacementID,
      sceneID: Configuration.interstitialSceneID,
    );
  }
}
