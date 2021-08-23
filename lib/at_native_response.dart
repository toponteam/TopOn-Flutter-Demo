
import 'package:anythink_sdk/at_base_response.dart';


/*Native ad status */
enum NativeStatus {
  nativeAdFailToLoadAD,
  nativeAdDidFinishLoading,
  nativeAdDidClick,
  nativeAdDidDeepLink,
  nativeAdDidEndPlayingVideo,
  nativeAdEnterFullScreenVideo,
  nativeAdExitFullScreenVideoInAd,
  nativeAdDidShowNativeAd,
  nativeAdDidStartPlayingVideo,
  nativeAdDidTapCloseButton,
  nativeAdDidLoadSuccessDraw,
  nativeAdDidCloseDetailInAdView,
  nativeAdUnknown
}

class ATNativeResponse extends BaseResponse{
  final NativeStatus nativeStatus;
  final Map extraMap;

  ATNativeResponse(this.nativeStatus,this.extraMap,String errStr,String placementID,bool isDeeplinkSuccess):
        super(errStr,placementID,isDeeplinkSuccess);

  factory ATNativeResponse.withMap(Map map){
    var tempRewardStatus;
    var requestMessage = map['requestMessage'];
    var placementID = map['placementID'];
    var adStatus = map['callbackName'];

    var tempExtraMap;

    var isDeeplinkSuccess = false;
    if (map.containsKey('isDeeplinkSuccess')){
      isDeeplinkSuccess =  map['isDeeplinkSuccess'];
    }
    if (map.containsKey('extraDic')){
      tempExtraMap =  map['extraDic'];
    }else{
      tempExtraMap =  {'message': 'No additional information'};
    }

    if (adStatus == 'nativeAdFailToLoadAD'){
      tempRewardStatus = NativeStatus.nativeAdFailToLoadAD;
    }
    else if(adStatus == 'nativeAdDidFinishLoading'){
      tempRewardStatus = NativeStatus.nativeAdDidFinishLoading;
    }
    else if(adStatus == 'nativeAdDidClick'){
      tempRewardStatus = NativeStatus.nativeAdDidClick;
    }
    else if(adStatus == 'nativeAdDidDeepLink'){
      tempRewardStatus = NativeStatus.nativeAdDidDeepLink;
    }
    else if(adStatus == 'nativeAdDidEndPlayingVideo'){
      tempRewardStatus = NativeStatus.nativeAdDidEndPlayingVideo;
    }
    else if(adStatus == 'nativeAdEnterFullScreenVideo'){
      tempRewardStatus = NativeStatus.nativeAdEnterFullScreenVideo;
    }
    else if(adStatus == 'nativeAdExitFullScreenVideoInAd'){
      tempRewardStatus = NativeStatus.nativeAdExitFullScreenVideoInAd;
    }
    else if(adStatus == 'nativeAdDidShowNativeAd'){
      tempRewardStatus = NativeStatus.nativeAdDidShowNativeAd;
    }
    else if(adStatus == 'nativeAdDidStartPlayingVideo'){
      tempRewardStatus = NativeStatus.nativeAdDidStartPlayingVideo;
    }
    else if(adStatus == 'nativeAdDidTapCloseButton'){
      tempRewardStatus = NativeStatus.nativeAdDidTapCloseButton;
    }
    else if(adStatus == 'nativeAdDidLoadSuccessDraw'){
      tempRewardStatus = NativeStatus.nativeAdDidLoadSuccessDraw;
    }
    else if(adStatus == 'nativeAdDidCloseDetailInAdView'){
      tempRewardStatus = NativeStatus.nativeAdDidCloseDetailInAdView;
    }

    else{
      tempRewardStatus = NativeStatus.nativeAdUnknown;
    }

    return ATNativeResponse(tempRewardStatus,tempExtraMap,requestMessage,placementID,isDeeplinkSuccess);
  }

}


