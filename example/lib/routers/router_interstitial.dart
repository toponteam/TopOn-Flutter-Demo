import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../manager/interstitial_sdk.dart';

class InterstitialRouter extends StatefulWidget {
  const InterstitialRouter({Key? key}) : super(key: key);

  @override
  _InterstitialRouterState createState() => _InterstitialRouterState();
}

class _InterstitialRouterState extends State<InterstitialRouter> {
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
                      onPressed: InterstitialManager.loadInterstitialAd,
                      child: Text("Load",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      onPressed: InterstitialManager.showSceneInterstitialAd,
                      child: Text("Show",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      onPressed: InterstitialManager.interstitialAdcheck,
                      child: Text("Ready Status",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
