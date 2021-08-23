
import 'package:anythink_sdk/at_base_response.dart';

/*Interstitial ad status*/
enum InterstitialStatus {
  interstitialAdFailToLoadAD,
  interstitialAdDidFinishLoading,
  interstitialAdDidDeepLink,
  interstitialAdDidClick,
  interstitialAdDidClose,
  interstitialAdDidStartPlaying,
  interstitialAdDidEndPlaying,
  interstitialDidFailToPlayVideo,
  interstitialDidShowSucceed,
  interstitialFailedToShow,
  interstitialUnknown
}

class ATInterstitialResponse extends BaseResponse{
  final InterstitialStatus interstatus;
  final Map extraMap;

  ATInterstitialResponse(this.interstatus,this.extraMap,String errStr,String placementID,bool isDeeplinkSuccess):
        super(errStr,placementID,isDeeplinkSuccess);

  factory ATInterstitialResponse.withMap(Map map){
    var temprewardstatus;

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

    if (adStatus == 'interstitialAdFailToLoadAD'){
      temprewardstatus = InterstitialStatus.interstitialAdFailToLoadAD;
    }
    else if(adStatus == 'interstitialAdDidFinishLoading'){
      temprewardstatus = InterstitialStatus.interstitialAdDidFinishLoading;
    }
    else if(adStatus == 'interstitialAdDidDeepLink'){
      temprewardstatus = InterstitialStatus.interstitialAdDidDeepLink;
    }
    else if(adStatus == 'interstitialAdDidEndPlaying'){
      temprewardstatus = InterstitialStatus.interstitialAdDidEndPlaying;
    }
    else if(adStatus == 'interstitialAdDidClick'){
      temprewardstatus = InterstitialStatus.interstitialAdDidClick;
    }
    else if(adStatus == 'interstitialAdDidClose'){
      temprewardstatus = InterstitialStatus.interstitialAdDidClose;
    }
    else if(adStatus == 'interstitialAdDidStartPlaying'){
      temprewardstatus = InterstitialStatus.interstitialAdDidStartPlaying;
    }
    else if( adStatus == 'interstitialAdDidEndPlaying'){
      temprewardstatus = InterstitialStatus.interstitialAdDidEndPlaying;
    }
    else if(adStatus == 'interstitialDidFailToPlayVideo'){
      temprewardstatus = InterstitialStatus.interstitialDidFailToPlayVideo;
    }
    else if(adStatus == 'interstitialDidShowSucceed'){
      temprewardstatus = InterstitialStatus.interstitialDidShowSucceed;
    }
    else if(adStatus == 'interstitialFailedToShow'){
      temprewardstatus = InterstitialStatus.interstitialFailedToShow;
    }
    else{
      temprewardstatus = InterstitialStatus.interstitialUnknown;
    }

    return ATInterstitialResponse(temprewardstatus,tempExtraMap,requestMessage,placementID,isDeeplinkSuccess);
  }

}