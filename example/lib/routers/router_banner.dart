import 'package:anythink_sdk/at_index.dart';
import 'package:anythink_sdk/at_platformview/at_banner_platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../manager/banner_sdk.dart';
import '../configuration_sdk.dart';

class BannerRouter extends StatefulWidget {
  const BannerRouter({Key? key}) : super(key: key);

  @override
  _BannerRouterState createState() => _BannerRouterState();
}

class _BannerRouterState extends State<BannerRouter> {
  @override
  void initState() {
    super.initState();
  }

  bool flag = false;

  _checkReadyToShow() {
    ATBannerManager.bannerAdReady(

        placementID: Configuration.bannerPlacementID,
    ).then((value) {

      if (value) {

        setState(() {
          flag = true;
        });

      } else {
        print('flutter banner no cache');
      }
    });
  }
  _remove() {
    setState(() {
      flag = false;
    });
  }

  _getBannerView() {
    if (!flag) {
      return null;
    } else {
      return PlatformBannerWidget(
        Configuration.bannerPlacementID,sceneID: Configuration.bannerSceneID
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Back",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      onPressed: BannerManager.loadBannerWith,
                      child: Text("Load",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      onPressed: _checkReadyToShow,
                      // onPressed: BannerManager.showAdInPosition,
                      child: Text("Show",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      // onPressed: BannerManager.removeBannerAd,
                      onPressed: _remove,
                      child: Text("Remove",
                          style: TextStyle(

                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      // onPressed: BannerManger.checkBannerLoadStatus,
                      onPressed: BannerManager.readyStatus,
                      child: Text("Ready Status",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 50),
                  child: _getBannerView(),
                ))
          ],
        ),
      ),
    );
  }


}
