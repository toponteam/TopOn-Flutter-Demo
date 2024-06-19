
import 'package:anythink_sdk/at_index.dart';
import '../configuration_sdk.dart';


final InitManger = InitTool();


class InitTool{

  setLogEnabled() async {
    await ATInitManger
        .setLogEnabled(
      logEnabled: true,
    );
  }

  setChannelStr() async {
    await ATInitManger
        .setChannelStr(
      channelStr: "test_setChannel",
    );
  }

  setSubchannelStr() async {
    await ATInitManger
        .setSubChannelStr(
      subchannelStr: "test_setSubchannelStr",
    );
  }

  setCustomDataDic() async {
    await ATInitManger.setCustomDataMap(
      customDataMap: {
        'setCustomDataDic': 'myCustomDataDic',
      },
    );
  }

  setExludeBundleIDArray() async {
    await ATInitManger.setExludeBundleIDArray(
      exludeBundleIDList: ['test_setExludeBundleIDArray'],
    );
  }

  setPlacementCustomData() async {
    await ATInitManger.setPlacementCustomData(
      placementIDStr: 'b5b72b21184aa8',
      placementCustomDataMap: {'setPlacementCustomData': 'test_setPlacementCustomData'},
    );
  }

  getUserLocation() async {
    await ATInitManger.getUserLocation().then((value) {
      print('flutter: Get user location -- ${value.toString()}');
    });
  }

  getGDPRLevel() async {
    await ATInitManger.getGDPRLevel().then((value) {
      print('flutter:Get GDPR --${value.toString()}');
    });
  }
  setDataConsentSet() async {

    await ATInitManger.setDataConsentSet(
        gdprLevel:
    ATInitManger.dataConsentSetPersonalized());
  }

  deniedUploadDeviceInfo() async {

    await ATInitManger
        .deniedUploadDeviceInfo(
        deniedUploadDeviceInfoList: [ATInitManger.aOAID()]);
  }




  initTopon() async {
    await ATInitManger.initAnyThinkSDK(
        appidStr: Configuration.appidStr,
        appidkeyStr: Configuration.appidkeyStr);
  }

  showGDPRAuth()async{
    await ATInitManger.showGDPRAuth();
  }

  initListen() {
    ATListenerManager.initEventHandler.listen((value) {

      if (value.userLocation != null) {
        switch (value.userLocation) {
          case InitUserLocation.initUserLocationInEU:
            print("flutter Monitor initial user location in the EU--");

            ATInitManger.getGDPRLevel().then((value) {
              if (value == ATInitManger.dataConsentSetUnknown()) {
                showGDPRAuth();
              }
            });

            break;

          case InitUserLocation.initUserLocationOutOfEU:
            print("flutter: flutter The location of the listening initial user is not in the EU");
            break;
          case InitUserLocation.initUserLocationUnknown:
            print("flutter: flutter The location of the initial listening user is unknown");
            break;
        }
      }

      if (value.consentSet != null) {
        switch (value.consentSet) {
          case InitConsentSet.initConsentSetPersonalized:
            print("flutter: flutter initConsentSetPersonalized");
            break;
          case InitConsentSet.initConsentSetNonpersonalized:
            print("flutter: flutter initConsentSetNonpersonalized");
            break;
          case InitConsentSet.initConsentSetUnknown:
            print("flutter: flutter initConsentSetUnknown");
            break;
        }
      }

    });
  }




}


