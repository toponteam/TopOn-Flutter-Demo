
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

   else{
     tempRewardStatus = RewardedStatus.rewardedVideoUnknown;
   }

   return ATRewardResponse(tempRewardStatus,tempExtraMap,requestMessage,placementID,isDeeplinkSuccess);

 }
}







