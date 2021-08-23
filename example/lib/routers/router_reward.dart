import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../manager/rewarder_sdk.dart';

class RewardRouter extends StatefulWidget {
  const RewardRouter({Key? key}) : super(key: key);

  @override
  _RewardRouterState createState() => _RewardRouterState();
}

class _RewardRouterState extends State<RewardRouter> {
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
                      onPressed: RewarderManager.loadRewardedVideo,
                      child: Text("Load",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      onPressed: RewarderManager.showSceneRewardedAd,
                      child: Text("Show",
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white70),
                      onPressed: RewarderManager.rewardVideocheck,
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
