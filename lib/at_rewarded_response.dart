
import 'package:anythink_sdk/at_base_response.dart';

/*Rewarded video status */
enum RewardedStatus {
  rewardedVideoDidFinishLoading,
  rewardedVideoDidFailToLoad,
  rewardedVideoDidStartPlaying,
  rewardedVideoDidEndPlaying,
  rewardedVideoDidFailToPlay,
  rewardedVideoDidRewardSuccess,
  rewardedVideoDidClick,
  rewardedVideoDidClose,
  rewardedVideoDidDeepLink,

  rewardedVideoDidAgainStartPlaying,
  rewardedVideoDidAgainEndPlaying,
  rewardedVideoDidAgainFailToPlay,
  rewardedVideoDidAgainRewardSuccess,
  rewardedVideoDidAgainClick,

  rewardedVideoUnknown
}

/*Incentive video callback */
class ATRewardResponse extends BaseResponse {
  final RewardedStatus rewardStatus;
  final Map extraMap;

  ATRewardResponse(this.rewardStatus,this.extraMap,String errStr,String placementID,bool isDeeplinkSuccess):
        super(errStr,placementID,isDeeplinkSuccess);

 factory ATRewardResponse.withMap(Map map){

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

   if (adStatus == 'rewardedVideoDidFailToLoad'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidFailToLoad;
   }
   else if(adStatus == 'rewardedVideoDidFinishLoading'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidFinishLoading;
   }
   else if(adStatus == 'rewardedVideoDidStartPlaying'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidStartPlaying;
   }
   else if(adStatus == 'rewardedVideoDidEndPlaying'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidEndPlaying;
   }
   else if(adStatus == 'rewardedVideoDidFailToPlay'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidFailToPlay;
   }
   else if(adStatus == 'rewardedVideoDidRewardSuccess'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidRewardSuccess;
   }
   else if(adStatus == 'rewardedVideoDidClick'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidClick;
   }
   else if(adStatus == 'rewardedVideoDidClose'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidClose;
   }
   else if(adStatus == 'rewardedVideoDidDeepLink'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidDeepLink;
   }

   else if(adStatus == 'rewardedVideoDidAgainStartPlaying'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidAgainStartPlaying;
   }
   else if(adStatus == 'rewardedVideoDidAgainEndPlaying'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidAgainEndPlaying;
   }
   else if(adStatus == 'rewardedVideoDidAgainFailToPlay'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidAgainFailToPlay;
   }
   else if(adStatus == 'rewardedVideoDidAgainClick'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidAgainClick;
   }
   else if(adStatus == 'rewardedVideoDidAgainRewardSuccess'){
     tempRewardStatus = RewardedStatus.rewardedVideoDidAgainRewardSuccess;
   }

   else{
     tempRewardStatus = RewardedStatus.rewardedVideoUnknown;
   }

   return ATRewardResponse(tempRewardStatus,tempExtraMap,requestMessage,placementID,isDeeplinkSuccess);

 }
}







