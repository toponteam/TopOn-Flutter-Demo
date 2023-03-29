import 'package:anythink_sdk/at_index.dart';
import '../topsize.dart';
import '../configuration_sdk.dart';

final NativeManager = NativeTool();

class NativeTool {
  loadNativeWith() async {
    await ATNativeManager.loadNativeAd(
        placementID: Configuration.nativePlacementID,
        extraMap: {
          ATCommon.isNativeShow() : true,
          ATCommon.getAdSizeKey(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth(),
            340,
          ),
          ATNativeManager.isAdaptiveHeight(): true
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



  // showNative() async {
  //   await ATNativeManager.showNativeAd(
  //       placementID: Configuration.nativePlacementID,
  //       extraMap: {
  //         ATNativeManager.parent(): ATNativeManager.createNativeSubViewAttribute(
  //           topSizeTool.getWidth(),
  //           topSizeTool.getHeight(),
  //           x: 0,
  //           y: 100,
  //         ),
  //         ATNativeManager.appIcon(): ATNativeManager.createNativeSubViewAttribute(
  //             50, 50,
  //             x: 20, y: 70, backgroundColorStr: 'clearColor'),
  //         ATNativeManager.mainTitle():
  //         ATNativeManager.createNativeSubViewAttribute(
  //           topSizeTool.getWidth() - 100,
  //           40,
  //           x: 90,
  //           y: 70,
  //           textSize: 15,
  //         ),
  //         ATNativeManager.desc(): ATNativeManager.createNativeSubViewAttribute(
  //           topSizeTool.getWidth() - 100,
  //           40,
  //           x: 90,
  //           y: 120,
  //           textSize: 15,
  //         ),
  //         ATNativeManager.cta(): ATNativeManager.createNativeSubViewAttribute(
  //           50,
  //           50,
  //           x: 90,
  //           y: 170,
  //           textSize: 15,
  //         ),
  //         ATNativeManager.mainImage():
  //         ATNativeManager.createNativeSubViewAttribute(
  //           topSizeTool.getWidth() - 40,
  //           topSizeTool.getHeight() - 200,
  //           x: 20,
  //           y: 220,
  //         ),
  //         ATNativeManager.adLogo(): ATNativeManager.createNativeSubViewAttribute(
  //           100,
  //           50,
  //           x: topSizeTool.getWidth() - 100,
  //           y: topSizeTool.getHeight() - 70,
  //         ),
  //         ATNativeManager.dislike(): ATNativeManager.createNativeSubViewAttribute(
  //           80,
  //           80,
  //           x: 20,
  //           y: 0,
  //         ),
  //       }).then((value) {
  //     print('flutter showNativeAd: $value');
  //   });
  // }

  showSceneNativeAd() async {
    await ATNativeManager.showSceneNativeAd(
        placementID: Configuration.nativePlacementID,
        sceneID: Configuration.nativeSceneID,
        extraMap: {
          ATNativeManager.parent(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth(),
            topSizeTool.getHeight(),
            x: 0,
            y: 100,
          ),
          ATNativeManager.appIcon(): ATNativeManager.createNativeSubViewAttribute(
              50, 50,
              x: 20, y: 70, backgroundColorStr: 'clearColor'),
          ATNativeManager.mainTitle():
          ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth() - 100,
            40,
            x: 90,
            y: 70,
            textSize: 15,
          ),
          ATNativeManager.desc(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth() - 100,
            40,
            x: 90,
            y: 120,
            textSize: 15,
          ),
          ATNativeManager.cta(): ATNativeManager.createNativeSubViewAttribute(
            50,
            50,
            x: 90,
            y: 170,
            textSize: 15,
          ),
          ATNativeManager.mainImage():
          ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth() - 40,
            topSizeTool.getHeight() - 200,
            x: 20,
            y: 220,
          ),
          ATNativeManager.adLogo(): ATNativeManager.createNativeSubViewAttribute(
            100,
            50,
            x: topSizeTool.getWidth() - 100,
            y: topSizeTool.getHeight() - 70,
          ),
          ATNativeManager.dislike(): ATNativeManager.createNativeSubViewAttribute(
            80,
            80,
            x: 20,
            y: 0,
          ),
        });
  }



  showNative() async {
    await ATNativeManager.showNativeAd(
        placementID: Configuration.nativePlacementID,
        extraMap: {
          ATNativeManager.parent(): ATNativeManager.createNativeSubViewAttribute(
              topSizeTool.getWidth(),
              340,
              x: 0,
              y: 200,
              backgroundColorStr: '#FFFFFF'
          ),
          ATNativeManager.appIcon(): ATNativeManager.createNativeSubViewAttribute(
              50,
              50,
              x: 10,
              y: 40,
              backgroundColorStr: 'clearColor'),
          ATNativeManager.mainTitle(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth() - 190,
            20,
            x: 70,
            y: 40,
            textSize: 15,
          ),
          ATNativeManager.desc(): ATNativeManager.createNativeSubViewAttribute(
              topSizeTool.getWidth() - 190,
              20,
              x: 70,
              y:70,
              textSize: 15),
          ATNativeManager.cta(): ATNativeManager.createNativeSubViewAttribute(
              100,
              50,
              x: topSizeTool.getWidth() - 110,
              y: 40,
              textSize: 15,
              textColorStr: "#FFFFFF",
              backgroundColorStr: "#2095F1"
          ),
          ATNativeManager.mainImage(): ATNativeManager.createNativeSubViewAttribute(
              topSizeTool.getWidth() - 20,
              topSizeTool.getWidth() * 0.6,
              x: 10,
              y: 100,
              backgroundColorStr: '#00000000'),
          ATNativeManager.adLogo(): ATNativeManager.createNativeSubViewAttribute(
              20,
              10,
              x: 10,
              y: 10,
              backgroundColorStr: '#00000000'),
          ATNativeManager.dislike(): ATNativeManager.createNativeSubViewAttribute(
            20,
            20,
            x: topSizeTool.getWidth() - 30,
            y: 10,
          ),
        }, isAdaptiveHeight: true);
  }

  removeNativeAd() async {
    await ATNativeManager.removeNativeAd(
        placementID: Configuration.nativePlacementID
    );
  }
}
