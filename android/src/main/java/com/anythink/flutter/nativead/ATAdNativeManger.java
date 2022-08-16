package com.anythink.flutter.nativead;

import androidx.annotation.NonNull;

import com.anythink.flutter.HandleAnyThinkMethod;
import com.anythink.flutter.utils.Const;

import org.json.JSONException;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ATAdNativeManger implements HandleAnyThinkMethod {
    static Map<String, ATNativeHelper> pidHelperMap = new ConcurrentHashMap<>();

    private static class SingletonClassInstance {
        private static final ATAdNativeManger instance = new ATAdNativeManger();
    }

    private ATAdNativeManger() {
    }

    public static ATAdNativeManger getInstance() {
        return SingletonClassInstance.instance;
    }

    @Override
    public boolean handleMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) throws JSONException {

        String placementID = methodCall.argument(Const.PLACEMENT_ID);
        Map<String, Object> settingMap = methodCall.argument(Const.EXTRA_DIC);

        ATNativeHelper helper = getHelper(placementID);
        switch (methodCall.method) {
            case "loadNativeAd":
                if (helper != null) {
                    helper.loadNative(placementID, settingMap);
                }
                break;
            case "nativeAdReady":
                if (helper != null) {
                    boolean ready = helper.isReady();
                    result.success(ready);
                } else {
                    result.success(false);
                }
                break;
            case "checkNativeAdLoadStatus":
                if (helper != null) {
                    Map<String, Object> map = helper.checkAdStatus();
                    result.success(map);
                } else {
                    result.success(new HashMap<String, Object>(1));
                }
                break;
            case "getNativeValidAds":
                if (helper != null) {
                    String s = helper.checkValidAdCaches();
                    result.success(s);
                } else {
                    result.success("");
                }
                break;

            case "showNativeAd":
                if (helper != null) {
                    boolean isAdaptiveHeight = false;
                    try {
                        isAdaptiveHeight = (Boolean) methodCall.argument(Const.Native.isAdaptiveHeight);
                    } catch (Throwable e) {
                    }

                    helper.showNativeAd(settingMap, null, isAdaptiveHeight);
                }
                break;
            case "showSceneNativeAd":
                if (helper != null) {
                    String scenario = methodCall.argument(Const.SCENE_ID);

                    boolean isAdaptiveHeight = false;
                    try {
                        isAdaptiveHeight = (Boolean) methodCall.argument(Const.Native.isAdaptiveHeight);
                    } catch (Throwable e) {
                    }

                    helper.showNativeAd(settingMap, scenario, isAdaptiveHeight);
                }

            case "removeNativeAd":
                if (helper != null) {
                    helper.removeNativeAd();
                }
                break;
        }
        return true;
    }


    public ATNativeHelper getHelper(String placementId) {
        ATNativeHelper helper;

        if (!pidHelperMap.containsKey(placementId)) {
            helper = new ATNativeHelper();
            pidHelperMap.put(placementId, helper);
        } else {
            helper = pidHelperMap.get(placementId);
        }

        return helper;
    }
}
