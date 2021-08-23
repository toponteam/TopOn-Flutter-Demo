import 'package:anythink_sdk/at_index.dart';
import '../topsize.dart';
import '../configuration_sdk.dart';

final NativeManager = NativeTool();

class NativeTool {
  loadNativeWith() async {
    await ATNativeManager.loadNativeAd(
        placementID: Configuration.nativePlacementID,
        extraMap: {
          ATCommon.getAdSizeKey(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth(),
            topSizeTool.getHeight(),
          ),
          ATNativeManager.isAdaptiveHeight(): true
        }).then((value) {
      print('flutter Native ad loading ends');
    });
  }

  nativeAdReady() async {
    await ATNativeManager.nativeAdReady(
      placementID: Configuration.nativePlacementID,
    ).then((value) {
      print('flutter nativeAdReady: $value');
    });
  }

  getNativeValidAds() async {
    await ATNativeManager.getNativeValidAds(
      placementID: Configuration.nativePlacementID,
    ).then((value) {
      print('flutter getNativeValidAds: $value');
    });
  }

  checkNativeLoadStatus() async {
    await ATNativeManager.checkNativeAdLoadStatus(
      placementID: Configuration.nativePlacementID,
    ).then((value) {
      print('flutter checkNativeAdLoadStatus: $value');
    });
  }

  readyStatus() async {
    await nativeAdReady();
    await checkNativeLoadStatus();
  }

}
