package com.anythink.flutter.banner;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;

import com.anythink.banner.api.ATBannerView;
import com.anythink.flutter.utils.Const;
import com.anythink.flutter.utils.MsgTools;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;


public class ATAndroidBannerView implements PlatformView {

    ATBannerView mBannerView;

    public ATAndroidBannerView(Context context, BinaryMessenger messenger, int viewID, Map<String, Object> args) {
        try {
            String placementID = (String) args.get(Const.PlatformViewKeys.PlacementID);
            String scenario = (String) args.get(Const.PlatformViewKeys.SceneID);

            MsgTools.printMsg("ATAndroidBannerView: " + placementID + ", scenario: " + scenario);

            if (TextUtils.isEmpty(placementID)) {
                MsgTools.printMsg("ATAndroidBannerView: placementId = null");
                return;
            }

            ATBannerHelper helper = ATAdBannerManger.getInstance().getHelper(placementID);
            mBannerView = helper.getBannerView();

            if (!TextUtils.isEmpty(scenario) && mBannerView != null) {
                mBannerView.setScenario(scenario);
            }
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    @Override
    public View getView() {
        return mBannerView;
    }

    @Override
    public void dispose() {

    }
}
