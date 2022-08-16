package com.anythink.flutter.banner;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

import com.anythink.banner.api.ATBannerExListener;
import com.anythink.banner.api.ATBannerView;
//import com.anythink.china.api.ATAppDownloadListener;
import com.anythink.core.api.ATAdInfo;
import com.anythink.core.api.ATAdStatusInfo;
import com.anythink.core.api.ATNetworkConfirmInfo;
//import com.anythink.core.api.ATSDK;
import com.anythink.core.api.AdError;
import com.anythink.flutter.ATFlutterEventManager;
import com.anythink.flutter.AnythinkSdkPlugin;
import com.anythink.flutter.utils.Const;
import com.anythink.flutter.utils.FlutterPluginUtil;
import com.anythink.flutter.utils.MsgTools;
import com.anythink.flutter.utils.Utils;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ATBannerHelper extends AnythinkSdkPlugin {

    Activity mActivity;
    String mPlacementId;
    ATBannerView mBannerView;

    public ATBannerHelper() {
        mActivity = FlutterPluginUtil.getActivity();
    }

    public void initBanner(String placementId) {
        mPlacementId = placementId;
        mBannerView = new ATBannerView(mActivity);
        mBannerView.setPlacementId(mPlacementId);
        mBannerView.setBannerAdListener(new ATBannerExListener() {
            @Override
            public void onDeeplinkCallback(boolean isRefresh, ATAdInfo atAdInfo, boolean isSuccess) {
                MsgTools.printMsg("banner onDeeplinkCallback: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.DeeplinkCallbackKey,
                        mPlacementId, atAdInfo.toString(), null, isSuccess);
            }

            @Override
            public void onDownloadConfirm(Context context, ATAdInfo atAdInfo, ATNetworkConfirmInfo atNetworkConfirmInfo) {
                MsgTools.printMsg("banner onDownloadConfirm: " + mPlacementId);
            }

            @Override
            public void onBannerLoaded() {
                MsgTools.printMsg("onBannerLoaded: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.LoadedCallbackKey,
                        mPlacementId, null, null);
            }

            @Override
            public void onBannerFailed(AdError adError) {
                MsgTools.printMsg("onBannerFailed: " + mPlacementId + ", " + adError.getFullErrorInfo());

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.LoadFailCallbackKey,
                        mPlacementId, null, adError.getFullErrorInfo());
            }

            @Override
            public void onBannerClicked(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onBannerClicked: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.ClickCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerShow(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onBannerShow: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.ShowCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerClose(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onBannerClose: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.CloseCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerAutoRefreshed(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onBannerAutoRefreshed: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.RefreshCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerAutoRefreshFail(AdError adError) {
                MsgTools.printMsg("onBannerAutoRefreshFail: " + mPlacementId + ", " + adError.getFullErrorInfo());

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.RefreshFailCallbackKey,
                        mPlacementId, null, adError.getFullErrorInfo());
            }
        });

        //download
//        try {
//            if (ATSDK.isCnSDK()) {
//                mBannerView.setAdDownloadListener(new ATAppDownloadListener() {
//                    @Override
//                    public void onDownloadStart(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("banner onDownloadStart: " + mPlacementId + ", " + totalBytes + ", " + currBytes + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadStartKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadUpdate(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("banner onDownloadUpdate: " + mPlacementId);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadUpdateKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadPause(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("banner onDownloadPause: " + mPlacementId);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadPauseKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadFinish(ATAdInfo atAdInfo, long totalBytes, String fileName, String appName) {
//                        MsgTools.printMsg("banner onDownloadFinish: " + mPlacementId + ", " + totalBytes + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadFinishedKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, -1, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadFail(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("banner onDownloadFail: " + mPlacementId + ", " + totalBytes + ", " + currBytes + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadFailedKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onInstalled(ATAdInfo atAdInfo, String fileName, String appName) {
//                        MsgTools.printMsg("banner onInstalled: " + mPlacementId + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadInstalledKey,
//                                mPlacementId, atAdInfo.toString(), -1, -1, fileName, appName);
//                    }
//                });
//            }
//        } catch (Throwable e) {
//        }
    }

    public void loadBanner(final String placementId, final Map<String, Object> settings) {
        MsgTools.printMsg("loadBanner: " + placementId + ", settings: " + settings);

        FlutterPluginUtil.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (mBannerView == null) {
                    initBanner(placementId);
                }

                if (settings != null) {
                    try {
                        Map<String, Object> map = (Map<String, Object>) settings.get(Const.SIZE);
                        int width = Utils.dip2px(mActivity, Double.parseDouble(map.get(Const.WIDTH).toString()));
                        int height = Utils.dip2px(mActivity, Double.parseDouble(map.get(Const.HEIGHT).toString()));

                        if (mBannerView != null) {
                            if (mBannerView.getLayoutParams() == null) {
                                FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(width, height);
                                mBannerView.setLayoutParams(lp);
                            } else {
                                mBannerView.getLayoutParams().width = width;
                                mBannerView.getLayoutParams().height = height;
                            }

                            MsgTools.printMsg("loadBanner: " + mPlacementId + ", width: " + width + ", height: " + height);

                            settings.put("key_width", width);
                            settings.put("key_height", height);
                        }
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }

                    try {
                        Object adaptiveWidthObject = settings.get(Const.Banner.adaptiveWidth);
                        if (adaptiveWidthObject != null) {
                            int width = Utils.dip2px(mActivity, Double.parseDouble(adaptiveWidthObject.toString()));
                            MsgTools.printMsg("loadBanner: " + mPlacementId + ", adaptiveWidth: " + width);
                            settings.put("adaptive_width", width);
                        }
                    } catch (Throwable e) {
                    }

                    try {
                        Object adaptiveOrientationObject = settings.get(Const.Banner.adaptiveOrientation);
                        if (adaptiveOrientationObject != null) {
                            int orientation = Utils.dip2px(mActivity, Integer.parseInt(adaptiveOrientationObject.toString()));
                            MsgTools.printMsg("loadBanner: " + mPlacementId + ", adaptiveOrientation: " + orientation);
                            settings.put("adaptive_orientation", orientation);
                        }
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }

                }
                mBannerView.setLocalExtra(settings);

                mBannerView.loadAd();
            }
        });
    }


    public boolean isAdReady() {
        MsgTools.printMsg("banner isAdReady: " + mPlacementId);

        boolean isReady = false;
        if (mBannerView != null) {
            ATAdStatusInfo atAdStatusInfo = mBannerView.checkAdStatus();
            if (atAdStatusInfo != null) {
                isReady = atAdStatusInfo.isReady();
            }
        }
        MsgTools.printMsg("banner isAdReady: " + mPlacementId + ", " + isReady);
        return isReady;
    }

    public Map<String, Object> checkAdStatus() {
        MsgTools.printMsg("banner checkAdStatus: " + mPlacementId);

        Map<String, Object> map = new HashMap<>(5);

        if (mBannerView != null) {
            ATAdStatusInfo atAdStatusInfo = mBannerView.checkAdStatus();
            boolean loading = atAdStatusInfo.isLoading();
            boolean ready = atAdStatusInfo.isReady();
            ATAdInfo atTopAdInfo = atAdStatusInfo.getATTopAdInfo();

            map.put("isLoading", loading);
            map.put("isReady", ready);

            if (atTopAdInfo != null) {
                map.put("adInfo", atTopAdInfo.toString());
            }

            return map;
        }

        map.put("isLoading", false);
        map.put("isReady", false);

        return map;
    }

    public String checkValidAdCaches() {
        MsgTools.printMsg("banner checkValidAdCaches: " + mPlacementId);

        if (mBannerView != null) {
            List<ATAdInfo> vaildAds = mBannerView.checkValidAdCaches();
            if (vaildAds == null) {
                return "";
            }

            JSONArray jsonArray = new JSONArray();

            int size = vaildAds.size();
            for (int i = 0; i < size; i++) {
                try {
                    jsonArray.put(new JSONObject(vaildAds.get(i).toString()));
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
            return jsonArray.toString();
        }
        return "";
    }


    public ATBannerView getBannerView() {
        return mBannerView;
    }



    public void showBannerWithRect(final Map<String, Object> settings, final String scenario) {
        MsgTools.printMsg("showBannerWithRect: " + mPlacementId + ", scenario: " + scenario);

        if (mBannerView != null) {

            int x = 0;
            int y = 0;
            int width = 0;
            int height = 0;

            if (settings != null) {
                Map<String, Object> size = (Map<String, Object>) settings.get(Const.SIZE);

                x = (int) size.get(Const.X);
                y = (int) size.get(Const.Y);
                width = (int) size.get(Const.WIDTH);
                height = (int) size.get(Const.HEIGHT);
            }

            final int finalX = x;
            final int finalY = y;
            final double finalWidth = width;
            final double finalHeight = height;
            FlutterPluginUtil.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams((int) finalWidth, (int) finalHeight);
                    layoutParams.leftMargin = (int) finalX;
                    layoutParams.topMargin = (int) finalY;
                    if (mBannerView.getParent() != null) {
                        ((ViewGroup) mBannerView.getParent()).removeView(mBannerView);
                    }
                    if (!TextUtils.isEmpty(scenario)) {
                        mBannerView.setScenario(scenario);
                    }

                    mActivity.addContentView(mBannerView, layoutParams);
                }
            });
        }
    }

    public void showBannerWithPosition(final String position, final String scenario) {
        MsgTools.printMsg("showBannerWithPosition: " + mPlacementId + ", scenario: " + scenario);

        FlutterPluginUtil.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (mBannerView != null) {
                    int width = mBannerView.getLayoutParams().width;
                    int height = mBannerView.getLayoutParams().height;
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(width, height);
                    if (position.equals(Const.POSITION_TOP)) {
                        layoutParams.gravity = Gravity.CENTER_HORIZONTAL | Gravity.TOP;
                    } else {
                        layoutParams.gravity = Gravity.CENTER_HORIZONTAL | Gravity.BOTTOM;
                    }

                    if (!TextUtils.isEmpty(scenario)) {
                        mBannerView.setScenario(scenario);
                    }

                    mActivity.addContentView(mBannerView, layoutParams);
                }
            }
        });
    }

    public void reshowBanner() {
        MsgTools.printMsg("reshowBanner: " + mPlacementId);

        FlutterPluginUtil.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (mBannerView != null) {
                    mBannerView.setVisibility(View.VISIBLE);
                } else {
                    MsgTools.printMsg("reshowBanner error, you must call loadBanner first, placementId: " + mPlacementId);
                }
            }
        });
    }

    public void hideBanner() {
        MsgTools.printMsg("hideBanner: " + mPlacementId);

        FlutterPluginUtil.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (mBannerView != null) {
                    mBannerView.setVisibility(View.GONE);
                } else {
                    MsgTools.printMsg("hideBanner error, you must call loadBanner first, placementId: " + mPlacementId);
                }
            }
        });
    }

    public void removeBanner() {
        MsgTools.printMsg("removeBanner: " + mPlacementId);

        FlutterPluginUtil.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (mBannerView != null) {
                    if (mBannerView.getParent() != null) {
                        ViewParent viewParent = mBannerView.getParent();
                        ((ViewGroup) viewParent).removeView(mBannerView);
                    }
                } else {
                    MsgTools.printMsg("removeBanner error, you must call loadBanner first, placementId: " + mPlacementId);
                }
            }
        });
    }

}
