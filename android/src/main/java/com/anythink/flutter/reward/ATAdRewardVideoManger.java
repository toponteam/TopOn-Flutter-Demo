package com.anythink.flutter.reward;

import androidx.annotation.NonNull;

import com.anythink.flutter.HandleAnyThinkMethod;
import com.anythink.flutter.utils.Const;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ATAdRewardVideoManger implements HandleAnyThinkMethod {
    Map<String, ATRewardVideoHelper> pidHelperMap = new ConcurrentHashMap<>();


    private static class SingletonClassInstance {
        private static final ATAdRewardVideoManger instance = new ATAdRewardVideoManger();
    }

    private ATAdRewardVideoManger() {
    }

    public static ATAdRewardVideoManger getInstance() {
        return SingletonClassInstance.instance;
    }

    @Override
    public boolean handleMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {

        String placementID = methodCall.argument(Const.PLACEMENT_ID);


        ATRewardVideoHelper helper = getHelper(placementID);

        switch (methodCall.method) {
            case "loadRewardedVideo":
                if (helper != null) {
                    Map<String, Object> settingMap = methodCall.argument(Const.EXTRA_DIC);

                    helper.loadRewardedVideo(placementID, settingMap);
                }
                break;
            case "showRewardedVideo":
                if (helper != null) {
                    helper.showRewardedVideo("");
                }
                break;
            case "showSceneRewardedVideo":
                if (helper != null) {
                    String scenario = methodCall.argument(Const.SCENE_ID);

                    helper.showRewardedVideo(scenario);
                }
                break;
            case "rewardedVideoReady":
                if (helper != null) {
                    boolean adReady = helper.isAdReady();
                    result.success(adReady);
                } else {
                    result.success(false);
                }
                break;
            case "checkRewardedVideoLoadStatus":
                if (helper != null) {
                    Map<String, Object> map = helper.checkAdStatus();
                    result.success(map);
                } else {
                    result.success(new HashMap<String, Object>(1));
                }
                break;
            case "getRewardedVideoValidAds":
                if (helper != null) {
                    String s = helper.checkValidAdCaches();
                    result.success(s);
                } else {
                    result.success("");
                }
                break;
        }
        return true;
    }

    private ATRewardVideoHelper getHelper(String placementId) {

        ATRewardVideoHelper helper;

        if (!pidHelperMap.containsKey(placementId)) {
            helper = new ATRewardVideoHelper();
            pidHelperMap.put(placementId, helper);
        } else {
            helper = pidHelperMap.get(placementId);
        }

        return helper;
    }

}
