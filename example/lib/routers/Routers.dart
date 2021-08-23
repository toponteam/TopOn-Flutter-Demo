

import 'package:anythink_sdk_example/main.dart';
import 'package:anythink_sdk_example/routers/router_banner.dart';
import 'package:anythink_sdk_example/routers/router_interstitial.dart';
import 'package:anythink_sdk_example/routers/router_native.dart';
import 'package:anythink_sdk_example/routers/router_reward.dart';

final anyThinkRouters = {
  "/": (context) => MyHome(),
  "/rewardRouter": (context) => RewardRouter(),
  "/interstitialRouter": (context) => InterstitialRouter(),
  "/bannerRouter": (context) => BannerRouter(),
  "/nativeRouter": (context) => NativeRouter(),
};