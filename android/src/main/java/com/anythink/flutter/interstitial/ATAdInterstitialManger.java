package com.anythink.flutter.interstitial;

import androidx.annotation.NonNull;

import com.anythink.flutter.HandleAnyThinkMethod;
import com.anythink.flutter.utils.Const;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ATAdInterstitialManger implements HandleAnyThinkMethod {
    static Map<String, ATInterstitialHelper> pidHelperMap = new ConcurrentHashMap<>();

    private static class SingletonClassInstance {
        private static final ATAdInterstitialManger instance = new ATAdInterstitialManger();
    }

    private ATAdInterstitialManger() {
    }


    public static ATAdInterstitialManger getInstance() {
        return SingletonClassInstance.instance;
    }

    @Override
    public boolean handleMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
        String placementID = methodCall.argument(Const.PLACEMENT_ID);
        Map<String, Object> settingMap = methodCall.argument(Const.EXTRA_DIC);

        ATInterstitialHelper helper = getHelper(placementID);

        switch (methodCall.method) {
            case "loadInterstitialAd":
                if (helper != null) {
                    helper.loadInterstitial(placementID, settingMap);
                }
                break;
            case "showInterstitialAd":
                if (helper != null) {
                    helper.showInterstitialAd("");
                }
                break;
            case "showSceneInterstitialAd":
                String scenario = methodCall.argument(Const.SCENE_ID);

                if (helper != null) {
                    helper.showInterstitialAd(scenario);
                }
                break;
            case "hasInterstitialAdReady":
                if (helper != null) {
                    boolean adReady = helper.isAdReady();
                    result.success(adReady);
                } else {
                    result.success(false);
                }
                break;
            case "getInterstitialValidAds":
                if (helper != null) {
                    String s = helper.checkValidAdCaches();
                    result.success(s);
                } else {
                    result.success("");
                }
                break;
            case "checkInterstitialLoadStatus":
                if (helper != null) {
                    Map<String, Object> map = helper.checkAdStatus();
                    result.success(map);
                } else {
                    result.success(new HashMap<String, Object>(1));
                }
                break;
        }
        return true;
    }

    private ATInterstitialHelper getHelper(String placementId) {
        ATInterstitialHelper helper;

        if (!pidHelperMap.containsKey(placementId)) {
            helper = new ATInterstitialHelper();
            pidHelperMap.put(placementId, helper);
        } else {
            helper = pidHelperMap.get(placementId);
        }

        return helper;
    }
}
