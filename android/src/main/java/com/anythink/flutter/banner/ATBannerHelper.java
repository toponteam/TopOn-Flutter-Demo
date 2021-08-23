package com.anythink.flutter.banner;

import android.app.Activity;
import android.widget.FrameLayout;

import com.anythink.banner.api.ATBannerExListener;
import com.anythink.banner.api.ATBannerView;
import com.anythink.china.api.ATAppDownloadListener;
import com.anythink.core.api.ATAdInfo;
import com.anythink.core.api.ATAdStatusInfo;
import com.anythink.core.api.ATSDK;
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
                MsgTools.pirntMsg("banner onDeeplinkCallback: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.DeeplinkCallbackKey,
                        mPlacementId, atAdInfo.toString(), null, isSuccess);
            }

            @Override
            public void onBannerLoaded() {
                MsgTools.pirntMsg("onBannerLoaded: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.LoadedCallbackKey,
                        mPlacementId, null, null);
            }

            @Override
            public void onBannerFailed(AdError adError) {
                MsgTools.pirntMsg("onBannerFailed: " + mPlacementId + ", " + adError.getFullErrorInfo());

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.LoadFailCallbackKey,
                        mPlacementId, null, adError.getFullErrorInfo());
            }

            @Override
            public void onBannerClicked(ATAdInfo atAdInfo) {
                MsgTools.pirntMsg("onBannerClicked: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.ClickCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerShow(ATAdInfo atAdInfo) {
                MsgTools.pirntMsg("onBannerShow: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.ShowCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerClose(ATAdInfo atAdInfo) {
                MsgTools.pirntMsg("onBannerClose: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.CloseCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerAutoRefreshed(ATAdInfo atAdInfo) {
                MsgTools.pirntMsg("onBannerAutoRefreshed: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.RefreshCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onBannerAutoRefreshFail(AdError adError) {
                MsgTools.pirntMsg("onBannerAutoRefreshFail: " + mPlacementId + ", " + adError.getFullErrorInfo());

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.BannerCall, Const.BannerCallback.RefreshFailCallbackKey,
                        mPlacementId, null, adError.getFullErrorInfo());
            }
        });

        try {
            if (ATSDK.isCnSDK()) {
                mBannerView.setAdDownloadListener(new ATAppDownloadListener() {
                    @Override
                    public void onDownloadStart(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
                        MsgTools.pirntMsg("banner onDownloadStart: " + mPlacementId + ", " + totalBytes + ", " + currBytes + ", " + fileName + ", " + appName);

                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadStartKey,
                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
                    }

                    @Override
                    public void onDownloadUpdate(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
                        MsgTools.pirntMsg("banner onDownloadUpdate: " + mPlacementId);

                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadUpdateKey,
                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
                    }

                    @Override
                    public void onDownloadPause(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
                        MsgTools.pirntMsg("banner onDownloadPause: " + mPlacementId);

                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadPauseKey,
                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
                    }

                    @Override
                    public void onDownloadFinish(ATAdInfo atAdInfo, long totalBytes, String fileName, String appName) {
                        MsgTools.pirntMsg("banner onDownloadFinish: " + mPlacementId + ", " + totalBytes + ", " + fileName + ", " + appName);

                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadFinishedKey,
                                mPlacementId, atAdInfo.toString(), totalBytes, -1, fileName, appName);
                    }

                    @Override
                    public void onDownloadFail(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
                        MsgTools.pirntMsg("banner onDownloadFail: " + mPlacementId + ", " + totalBytes + ", " + currBytes + ", " + fileName + ", " + appName);

                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadFailedKey,
                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
                    }

                    @Override
                    public void onInstalled(ATAdInfo atAdInfo, String fileName, String appName) {
                        MsgTools.pirntMsg("banner onInstalled: " + mPlacementId + ", " + fileName + ", " + appName);

                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadInstalledKey,
                                mPlacementId, atAdInfo.toString(), -1, -1, fileName, appName);
                    }
                });
            }
        } catch (Throwable e) {
        }
    }

    public void loadBanner(final String placementId, final Map<String, Object> settings) {
        MsgTools.pirntMsg("loadBanner: " + placementId + ", settings: " + settings);

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

                            MsgTools.pirntMsg("loadBanner: " + mPlacementId + ", width: " + width + ", height: " + height);

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
                            MsgTools.pirntMsg("loadBanner: " + mPlacementId + ", adaptiveWidth: " + width);
                            settings.put("adaptive_width", width);
                        }
                    } catch (Throwable e) {
                    }

                    try {
                        Object adaptiveOrientationObject = settings.get(Const.Banner.adaptiveOrientation);
                        if (adaptiveOrientationObject != null) {
                            int orientation = Utils.dip2px(mActivity, Integer.parseInt(adaptiveOrientationObject.toString()));
                            MsgTools.pirntMsg("loadBanner: " + mPlacementId + ", adaptiveOrientation: " + orientation);
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
        MsgTools.pirntMsg("banner isAdReady: " + mPlacementId);

        boolean isReady = false;
        if (mBannerView != null) {
            ATAdStatusInfo atAdStatusInfo = mBannerView.checkAdStatus();
            if (atAdStatusInfo != null) {
                isReady = atAdStatusInfo.isReady();
            }
        }
        MsgTools.pirntMsg("banner isAdReady: " + mPlacementId + ", " + isReady);
        return isReady;
    }

    public Map<String, Object> checkAdStatus() {
        MsgTools.pirntMsg("banner checkAdStatus: " + mPlacementId);

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
        MsgTools.pirntMsg("banner checkValidAdCaches: " + mPlacementId);

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
}
