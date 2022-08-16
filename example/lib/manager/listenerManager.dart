
import 'package:anythink_sdk/at_banner_response.dart';
import 'package:anythink_sdk/at_index.dart';
import 'package:anythink_sdk/at_interstitial_response.dart';
import 'package:anythink_sdk/at_listener.dart';


final ListenerManager = ListenerTool();


class ListenerTool {
  rewarderListen() {
    ATListenerManager.rewardedVideoEventHandler.listen((value) {

      switch (value.rewardStatus) {
        case RewardedStatus.rewardedVideoDidFailToLoad:
          print("flutter rewardedVideoDidFailToLoad ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case RewardedStatus.rewardedVideoDidFinishLoading:
          print("flutter rewardedVideoDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case RewardedStatus.rewardedVideoDidStartPlaying:
          print("flutter rewardedVideoDidStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidEndPlaying:
          print("flutter rewardedVideoDidEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidFailToPlay:
          print("flutter rewardedVideoDidFailToPlay ---- placementID: ${value.placementID} ---- errStr:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidRewardSuccess:
          print("flutter rewardedVideoDidRewardSuccess ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidClick:
          print("flutter rewardedVideoDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidDeepLink:
          print("flutter rewardedVideoDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}");
          break;
        case RewardedStatus.rewardedVideoDidClose:
          print("flutter rewardedVideoDidClose ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoUnknown:
          print("flutter rewardedVideoUnknown");
          break;

        case RewardedStatus.rewardedVideoDidAgainStartPlaying:
          print("flutter rewardedVideoDidAgainStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainEndPlaying:
          print("flutter rewardedVideoDidAgainEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainFailToPlay:
          print("flutter rewardedVideoDidAgainFailToPlay ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainRewardSuccess:
          print("flutter rewardedVideoDidAgainRewardSuccess ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case RewardedStatus.rewardedVideoDidAgainClick:
          print("flutter rewardedVideoDidAgainClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
      }
    });
  }

  interListen() {
    ATListenerManager.interstitialEventHandler.listen((value) {
      switch (value.interstatus) {
        case InterstitialStatus.interstitialAdFailToLoadAD:
          print("flutter interstitialAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case InterstitialStatus.interstitialAdDidFinishLoading:
          print("flutter interstitialAdDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case InterstitialStatus.interstitialAdDidStartPlaying:
          print("flutter interstitialAdDidStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialAdDidEndPlaying:
          print("flutter interstitialAdDidEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialDidFailToPlayVideo:
          print("flutter interstitialDidFailToPlayVideo ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case InterstitialStatus.interstitialDidShowSucceed:
          print("flutter interstitialDidShowSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialFailedToShow:
          print("flutter interstitialFailedToShow ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case InterstitialStatus.interstitialAdDidClick:
          print("flutter interstitialAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialAdDidDeepLink:
          print("flutter interstitialAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialAdDidClose:
          print("flutter interstitialAdDidClose ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case InterstitialStatus.interstitialUnknown:
          print("flutter interstitialUnknown");
          break;
      }
    });

  }

  bannerListen() {
    ATListenerManager.bannerEventHandler.listen((value) {
      switch (value.bannerStatus) {
        case BannerStatus.bannerAdFailToLoadAD:
          print(
              "flutter bannerAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case BannerStatus.bannerAdDidFinishLoading:
          print(
              "flutter bannerAdDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case BannerStatus.bannerAdAutoRefreshSucceed:
          print(
              "flutter bannerAdAutoRefreshSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdDidClick:
          print(
              "flutter bannerAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdDidDeepLink:
          print(
              "flutter bannerAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}");
          break;
        case BannerStatus.bannerAdDidShowSucceed:
          print(
              "flutter bannerAdDidShowSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdTapCloseButton:
          print(
              "flutter bannerAdTapCloseButton ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case BannerStatus.bannerAdAutoRefreshFail:
          print(
              "flutter bannerAdAutoRefreshFail ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case BannerStatus.bannerAdUnknown:
          print("flutter bannerAdUnknown");
          break;
      }
    });
  }

  nativeListen() {
    ATListenerManager.nativeEventHandler.listen((value) {
      switch (value.nativeStatus) {
        case NativeStatus.nativeAdFailToLoadAD:
          print("flutter nativeAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}");
          break;
        case NativeStatus.nativeAdDidFinishLoading:
          print("flutter nativeAdDidFinishLoading ---- placementID: ${value.placementID}");
          break;
        case NativeStatus.nativeAdDidClick:
          print("flutter nativeAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidDeepLink:
          print("flutter nativeAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}");
          break;
        case NativeStatus.nativeAdDidEndPlayingVideo:
          print("flutter nativeAdDidEndPlayingVideo ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdEnterFullScreenVideo:
          print("flutter nativeAdEnterFullScreenVideo ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdExitFullScreenVideoInAd:
          print("flutter nativeAdExitFullScreenVideoInAd ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidShowNativeAd:
          print("flutter nativeAdDidShowNativeAd ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidStartPlayingVideo:
          print("flutter nativeAdDidStartPlayingVideo ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidTapCloseButton:
          print("flutter nativeAdDidTapCloseButton ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidCloseDetailInAdView:
          print("flutter nativeAdDidCloseDetailInAdView ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdDidLoadSuccessDraw:
          print("flutter nativeAdDidLoadSuccessDraw ---- placementID: ${value.placementID} ---- extra:${value.extraMap}");
          break;
        case NativeStatus.nativeAdUnknown:
          print("flutter downloadUnknown");
          break;
      }
    });
  }

  downLoadListen() {
    ATListenerManager.downloadEventHandler.listen((value) {
      switch (value.downloadStatus) {
        case DownloadStatus.downloadStart:
          print("flutter downloadStart ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadUpdate:
          print("flutter downloadUpdate ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadPause:
          print("flutter downloadPause ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadFinished:
          print("flutter downloadFinished ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadFailed:
          print("flutter downloadFailed ---- placementID: ${value.placementID}, totalBytes: ${value.totalBytes}, currBytes: ${value.currBytes}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadInstalled:
          print("flutter downloadInstalled ---- placementID: ${value.placementID}, "
              "fileName: ${value.fileName}, appName: ${value.appName}, extra: ${value.extraMap}");
          break;
        case DownloadStatus.downloadUnknown:
          print("flutter downloadUnknow");
          break;
      }
    });
  }
}