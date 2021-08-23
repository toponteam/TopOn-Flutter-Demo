
/*download status*/
enum DownloadStatus {
  downloadStart,
  downloadUpdate,
  downloadPause,
  downloadFinished,
  downloadFailed,
  downloadInstalled,
  downloadUnknown
}

/*Download callback*/
class ATDownloadResponse {
  final String placementID;
  final DownloadStatus downloadStatus;
  final Map extraMap;
  final int totalBytes;
  final int currBytes;
  final String fileName;
  final String appName;

  ATDownloadResponse(this.downloadStatus,this.extraMap,this.placementID,this.totalBytes,this.currBytes,this.fileName,this.appName);

 factory ATDownloadResponse.withMap(Map map){

   var tempDownloadStatus;
   var placementID = map['placementID'];
   var adStatus = map['callbackName'];

   var tempExtraMap;

   if (map.containsKey('extraDic')){
     tempExtraMap =  map['extraDic'];
   }else{
     tempExtraMap =  {'message': 'No additional information'};
   }

   if (adStatus == 'downloadStart'){
     tempDownloadStatus = DownloadStatus.downloadStart;
   }
   else if(adStatus == 'downloadUpdate'){
     tempDownloadStatus = DownloadStatus.downloadUpdate;
   }
   else if(adStatus == 'downloadPause'){
     tempDownloadStatus = DownloadStatus.downloadPause;
   }
   else if(adStatus == 'downloadFinished'){
     tempDownloadStatus = DownloadStatus.downloadFinished;
   }
   else if(adStatus == 'downloadFailed'){
     tempDownloadStatus = DownloadStatus.downloadFailed;
   }
   else if(adStatus == 'downloadInstalled'){
     tempDownloadStatus = DownloadStatus.downloadInstalled;
   }

   else{
     tempDownloadStatus = DownloadStatus.downloadUnknown;
   }

   var totalBytes;
   if (map.containsKey('totalBytes')) {
     totalBytes = map['totalBytes'];
   } else {
     totalBytes = 0;
   }

   var currBytes;
   if (map.containsKey('currBytes')) {
     currBytes = map['currBytes'];
   } else {
     currBytes = 0;
   }

   var fileName;
   if (map.containsKey('fileName')) {
     fileName = map['fileName'];
   } else {
     fileName = 0;
   }

   var appName;
   if (map.containsKey('appName')) {
     appName = map['appName'];
   } else {
     appName = 0;
   }

   return ATDownloadResponse(tempDownloadStatus,tempExtraMap,placementID,totalBytes,currBytes,fileName,appName);

 }
}







