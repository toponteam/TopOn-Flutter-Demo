import 'package:anythink_sdk_example/manager/listenerManager.dart';
import 'package:flutter/material.dart';
import 'manager/init_sdk.dart';
import 'routers/Routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setSDK();
    _setListen();
  }

  _setSDK() {
    InitManger.setLogEnabled();
    InitManger.setExludeBundleIDArray();
    // InitManger.deniedUploadDeviceInfo();
    InitManger.initTopon();

    InitManger.setChannelStr();
    InitManger.setSubchannelStr();
    InitManger.setDataConsentSet();
    InitManger.setCustomDataDic();
    InitManger.setPlacementCustomData();
    InitManger.getGDPRLevel();
    InitManger.getUserLocation();
    // InitManger.showGDPRAuth();
  }

  _setListen() {
    // InitManger.initListen();
    // InterstitialManger.interListen();
    // RewarderManger.rewarderListen();
    // BannerManger.bannerListen();
    // NativeManager.nativeListen();
    ListenerManager.rewarderListen();
    ListenerManager.interListen();
    ListenerManager.bannerListen();
    ListenerManager.nativeListen();
    // ListenerManager.downLoadListen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyHome(),
      routes: anyThinkRouters,
      initialRoute: "/",
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
          alignment: Alignment.bottomLeft,
          height: 500.0,
          // width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'AnyThink SDK Demo',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 10, left: 10),

                      // width: 200.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      // color: Colors.white,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, "/rewardRouter");
                        },
                        child: Text("RewardVideo",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        // width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        // color: Colors.white,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, "/interstitialRouter");
                          },
                          child: Text("Interstitial",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                        ),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),

                        // width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        // color: Colors.white,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, "/bannerRouter");
                          },
                          child: Text("Banner",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),

                        // width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        // color: Colors.white,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, "/nativeRouter");
                          },
                          child: Text("Native",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                        ),
                      ))
                ],
              )
            ],
          ),
        )));
  }
}
