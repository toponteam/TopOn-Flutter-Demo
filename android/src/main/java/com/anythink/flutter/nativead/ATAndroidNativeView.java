package com.anythink.flutter.nativead;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;

import com.anythink.flutter.utils.Const;
import com.anythink.flutter.utils.MsgTools;
import com.anythink.nativead.api.ATNativeAdView;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;


public class ATAndroidNativeView implements PlatformView {

    ATNativeAdView anyThinkNativeAdView;

    public ATAndroidNativeView(Context context, BinaryMessenger messenger, int viewID, Map<String, Object> args) {
        try {
            String placementID = (String) args.get(Const.PlatformViewKeys.PlacementID);
            String scenario = (String) args.get(Const.PlatformViewKeys.SceneID);
            boolean isAdaptiveHeight = (Boolean) args.get(Const.PlatformViewKeys.isAdaptiveHeight);
            Map<String, Object> settings = (Map<String, Object>) args.get(Const.PlatformViewKeys.ExtraMap);

            MsgTools.printMsg("ATAndroidNativeView: " + placementID + ", scenario: " + scenario + ", settings: " + settings + ", isAdaptiveHeight: " + isAdaptiveHeight);

            if (TextUtils.isEmpty(placementID)) {
                MsgTools.printMsg("ATAndroidNativeView: placementId = null");
                return;
            }

            ATNativeHelper helper = ATAdNativeManger.getInstance().getHelper(placementID);
            anyThinkNativeAdView = helper.renderNativeView(settings, scenario, isAdaptiveHeight, true);
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }
    @Override
    public View getView() {
        return anyThinkNativeAdView;
    }

    @Override
    public void dispose() {

    }
}
