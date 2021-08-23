import 'dart:async';

import 'package:anythink_sdk/anythink_sdk.dart';

final ATInitManger = ATInit();

class ATInit {
  /*Set log switch */
  Future<bool> setLogEnabled({
    bool logEnabled = false,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("setLogEnabled", {
      "logEnabled": logEnabled,
    });
  }

  /*Set up channels */
  Future<String> setChannelStr({String? channelStr}) async {
    return await AnythinkSdk.channel.invokeMethod("setChannelStr", {
      "channelStr": channelStr,
    });
  }

  /*Set up sub-channels */
  Future<String> setSubChannelStr({String? subchannelStr}) async {
    return await AnythinkSdk.channel.invokeMethod("setSubchannelStr", {
      "subchannelStr": subchannelStr,
    });
  }

  /*Set up custom rules*/
  Future<Map> setCustomDataMap({
    Map<String, Object>? customDataMap,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("setCustomDataDic", {
      "customDataDic": customDataMap,
    });
  }

/*Set up exclusion cross-promotion list */
  Future<List> setExludeBundleIDArray({
    List<String>? exludeBundleIDList,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("setExludeBundleIDArray", {
      "exludeBundleIDArray": exludeBundleIDList,
    });
  }

/*Set to limit the reporting of these private data */
  Future<List> deniedUploadDeviceInfo({
    List<String>? deniedUploadDeviceInfoList,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("deniedUploadDeviceInfo", {
      "deniedUploadInfoArray": deniedUploadDeviceInfoList,
    });
  }

  /*System version number */
  String aVersionNameKey() {
    return 'os_vn';
  }

  /*System version number */
  String aVersionCodeKey() {
    return 'os_vc';
  }

  /*Application package name */
  String aPackageNameKey() {
    return 'package_name';
  }

  /*Application version name */
  String aAppVersionNameKey() {
    return 'app_vn';
  }

  /*App version number */
  String aAppVersionCodeKey() {
    return 'app_vc';
  }

  /*Equipment Brand */
  String aBrandKey() {
    return 'brand';
  }

  /*Device model */
  String aModelKey() {
    return 'model';
  }

  /*Screen Resolution */
  String aScreenKey() {
    return 'screen';
  }

  /*Network Type */
  String aNetworkTypeKey() {
    return 'network_type';
  }

  /*Mobile network code */
  String aMNCKey() {
    return 'mnc';
  }

  /*Mobile country code */
  String aMCCKey() {
    return 'mcc';
  }

  /*System language */
  String aLanguageKey() {
    return 'language';
  }

  /*Time zone */
  String aTimeZoneKey() {
    return 'timezone';
  }

  /*User Agent*/
  String aUserAgentKey() {
    return 'ua';
  }

  /*Screen orientation */
  String aOrientKey() {
    return 'orient';
  }

  /*idfa*/
  String aIDFAKey() {
    return 'idfa';
  }

/*idfv*/
  String aIDFVKey() {
    return 'idfv';
  }

/*Android ID*/
  String aANDROID() {
    return 'android_id';
  }

  /*Google Ad ID*/
  String aGAID() {
    return 'gaid';
  }

  /*App install source*/
  String aINSTALLER() {
    return 'it_src';
  }

  /*MAC address*/
  String aMAC() {
    return 'mac';
  }

/*International Mobile Equipment Identity*/
  String aIMEI() {
    return 'imei';
  }

  /*OAID*/
  String aOAID() {
    return 'oaid';
  }

/*Set Placement rules*/
  Future<String> setPlacementCustomData({
    Map<String, Object>? placementCustomDataMap,
    String? placementIDStr,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("setPlacementCustomData", {
      "placementCustomDataDic": placementCustomDataMap,
      "placementIDStr": placementIDStr,
    });
  }

  /*Get GDPR grade*/
  Future<String> getGDPRLevel() async {
    return await AnythinkSdk.channel.invokeMethod("getGDPRLevel", {});
  }

  /*Get user location*/
  Future<String> getUserLocation() async {
    return await AnythinkSdk.channel.invokeMethod("getUserLocation", {});
  }

  /*Show the GDPR authorization interface*/
  Future<String> showGDPRAuth() async {
    return await AnythinkSdk.channel.invokeMethod("showGDPRAuth", {});
  }

/*Set GDPR level*/
  Future<String> setDataConsentSet({
    required String gdprLevel,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("setDataConsentSet", {
      "gdprLevel": gdprLevel,
    });
  }

  String dataConsentSetNonpersonalized() {
    return 'ATDataConsentSetNonpersonalized';
  }

  String dataConsentSetPersonalized() {
    return 'ATDataConsentSetPersonalized';
  }

  String dataConsentSetUnknown() {
    return 'ATDataConsentSetUnknown';
  }

/*Initialize SDK*/
  Future<String> initAnyThinkSDK({
    required String appidStr,
    required String appidkeyStr,
  }) async {
    return await AnythinkSdk.channel.invokeMethod("initAnyThinkSDK", {
      "appIdStr": appidStr,
      "appKeyStr": appidkeyStr,
    });
  }
}
