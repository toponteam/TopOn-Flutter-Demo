import 'package:anythink_sdk/at_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configuration_sdk.dart';
import '../manager/native_sdk.dart';
import '../topsize.dart';

class NativeRouter extends StatefulWidget {
  const NativeRouter({Key? key}) : super(key: key);

  @override
  _NativeRouterState createState() => _NativeRouterState();
}

class _NativeRouterState extends State<NativeRouter> {
  @override
  void initState() {
    super.initState();
  }

  bool flag = false;


  _checkReadyToShow() {
    ATNativeManager.nativeAdReady(
      placementID: Configuration.nativePlacementID,
    ).then((value) {

      if (value) {

        setState(() {
          flag = true;
        });

      } else {
        print('flutter native no cache');
      }
    });
  }
  _remove() {
    setState(() {
      flag = false;
    });
  }

  _getNativeView() {
    if (!flag) {
      return null;
    } else {
      return PlatformNativeWidget(Configuration.nativePlacementID, {
        ATNativeManager.parent(): ATNativeManager.createNativeSubViewAttribute(
          topSizeTool.getWidth(), 340,
          backgroundColorStr: '#FFFFFF'
        ),
        ATNativeManager.appIcon(): ATNativeManager.createNativeSubViewAttribute(
            50, 50,
            x: 10, y: 40, backgroundColorStr: 'clearColor'),
        ATNativeManager.mainTitle(): ATNativeManager.createNativeSubViewAttribute(
          topSizeTool.getWidth() - 190,
          20,
          x: 70,
          y: 40,
          textSize: 15,
        ),
        ATNativeManager.desc(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth() - 190, 20,
            x: 70, y:70, textSize: 15),
        ATNativeManager.cta(): ATNativeManager.createNativeSubViewAttribute(
          100,
          50,
          x: topSizeTool.getWidth() - 110,
          y: 40,
          textSize: 15,
          textColorStr: "#FFFFFF",
          backgroundColorStr: "#2095F1",
          textAlignmentStr: "center",
        ),
        ATNativeManager.mainImage(): ATNativeManager.createNativeSubViewAttribute(
            topSizeTool.getWidth() - 20, topSizeTool.getWidth() * 0.6,
            x: 10, y: 100, backgroundColorStr: '#00000000'),
        ATNativeManager.adLogo(): ATNativeManager.createNativeSubViewAttribute(
            20, 10,
            x: 10,
            y: 10,
            backgroundColorStr: '#00000000'),
        ATNativeManager.dislike(): ATNativeManager.createNativeSubViewAttribute(
          20,
          20,
          x: topSizeTool.getWidth() - 30,
          y: 10,
        ),
      },sceneID: Configuration.nativeSceneID);
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
                      onPressed: NativeManager.loadNativeWith,
                      child: Text("Load",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      // onPressed: NativeManager.showNative,
                      onPressed: _checkReadyToShow,
                      child: Text("Show",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      // onPressed: NativeManager.removeNativeAd,
                      onPressed: _remove,
                      child: Text("Remove",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      // onPressed: NativeManger.nativeAdReady,
                      onPressed: NativeManager.readyStatus,
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
                  height: 1000,
                  width: 800,
                  color: Colors.deepPurple,
                  margin: EdgeInsets.only(top: 100),
                  child: _getNativeView(),
                ))
          ],
        ),
      ),
    );
  }
}
