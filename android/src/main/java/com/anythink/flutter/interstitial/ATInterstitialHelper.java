package com.anythink.flutter.interstitial;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;

//import com.anythink.china.api.ATAppDownloadListener;
import com.anythink.core.api.ATAdInfo;
import com.anythink.core.api.ATAdStatusInfo;
import com.anythink.core.api.ATNetworkConfirmInfo;
//import com.anythink.core.api.ATSDK;
import com.anythink.core.api.AdError;
import com.anythink.flutter.ATFlutterEventManager;
import com.anythink.flutter.utils.Const;
import com.anythink.flutter.utils.FlutterPluginUtil;
import com.anythink.flutter.utils.MsgTools;
import com.anythink.flutter.utils.Utils;
import com.anythink.interstitial.api.ATInterstitial;
import com.anythink.interstitial.api.ATInterstitialExListener;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ATInterstitialHelper {

    Activity mActivity;
    ATInterstitial mInterstitialAd;
    String mPlacementId;

    public ATInterstitialHelper() {
        mActivity = FlutterPluginUtil.getActivity();
    }

    private void initInterstitial(final String placementId) {
        mPlacementId = placementId;
        mInterstitialAd = new ATInterstitial(mActivity, placementId);
        mInterstitialAd.setAdListener(new ATInterstitialExListener() {
            @Override
            public void onDeeplinkCallback(ATAdInfo atAdInfo, boolean isSuccess) {
                MsgTools.printMsg("interstitial onDeeplinkCallback: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.DeeplinkCallbackKey,
                        mPlacementId, atAdInfo.toString(), null, isSuccess);
            }

            @Override
            public void onDownloadConfirm(Context context, ATAdInfo atAdInfo, ATNetworkConfirmInfo atNetworkConfirmInfo) {
                MsgTools.printMsg("interstitial onDownloadConfirm: " + mPlacementId);
            }

            @Override
            public void onInterstitialAdLoaded() {
                MsgTools.printMsg("onInterstitialAdLoaded: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.LoadedCallbackKey,
                        mPlacementId, null, null);
            }

            @Override
            public void onInterstitialAdLoadFail(AdError adError) {
                MsgTools.printMsg("onInterstitialAdLoadFail: " + mPlacementId + ", " + adError.getFullErrorInfo());

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.LoadFailCallbackKey,
                        mPlacementId, null, adError.getFullErrorInfo());
            }

            @Override
            public void onInterstitialAdClicked(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onInterstitialAdClicked: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.ClickCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onInterstitialAdShow(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onInterstitialAdShow: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.ShowCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onInterstitialAdClose(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onInterstitialAdClose: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.CloseCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onInterstitialAdVideoStart(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onInterstitialAdVideoStart: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.PlayStartCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onInterstitialAdVideoEnd(ATAdInfo atAdInfo) {
                MsgTools.printMsg("onInterstitialAdVideoEnd: " + mPlacementId);

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.PlayEndCallbackKey,
                        mPlacementId, atAdInfo.toString(), null);
            }

            @Override
            public void onInterstitialAdVideoError(AdError adError) {
                MsgTools.printMsg("onInterstitialAdVideoError: " + mPlacementId + ", " + adError.getFullErrorInfo());

                ATFlutterEventManager.getInstance().sendCallbackMsgToFlutter(
                        Const.CallbackMethodCall.InterstitialCall, Const.InterstitialCallback.PlayFailCallbackKey,
                        mPlacementId, null, adError.getFullErrorInfo());
            }
        });

        //download
//        try {
//            if (ATSDK.isCnSDK()) {
//                mInterstitialAd.setAdDownloadListener(new ATAppDownloadListener() {
//                    @Override
//                    public void onDownloadStart(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("interstitial onDownloadStart: " + mPlacementId + ", " + totalBytes + ", " + currBytes + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadStartKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadUpdate(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("interstitial onDownloadUpdate: " + mPlacementId);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadUpdateKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadPause(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("interstitial onDownloadPause: " + mPlacementId);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadPauseKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadFinish(ATAdInfo atAdInfo, long totalBytes, String fileName, String appName) {
//                        MsgTools.printMsg("interstitial onDownloadFinish: " + mPlacementId + ", " + totalBytes + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadFinishedKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, -1, fileName, appName);
//                    }
//
//                    @Override
//                    public void onDownloadFail(ATAdInfo atAdInfo, long totalBytes, long currBytes, String fileName, String appName) {
//                        MsgTools.printMsg("interstitial onDownloadFail: " + mPlacementId + ", " + totalBytes + ", " + currBytes + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadFailedKey,
//                                mPlacementId, atAdInfo.toString(), totalBytes, currBytes, fileName, appName);
//                    }
//
//                    @Override
//                    public void onInstalled(ATAdInfo atAdInfo, String fileName, String appName) {
//                        MsgTools.printMsg("interstitial onInstalled: " + mPlacementId + ", " + fileName + ", " + appName);
//
//                        ATFlutterEventManager.getInstance().sendDownloadMsgToFlutter(Const.CallbackMethodCall.DownloadCall, Const.DownloadCallCallback.DownloadInstalledKey,
//                                mPlacementId, atAdInfo.toString(), -1, -1, fileName, appName);
//                    }
//                });
//            }
//        } catch (Throwable e) {
//        }
    }

    public void loadInterstitial(final String placementId, final Map<String, Object> settings) {
        MsgTools.printMsg("loadInterstitial: " + placementId + ", settings: " + settings);

        if (mInterstitialAd == null) {
            initInterstitial(placementId);
        }

        if (settings != null) {

            try {
                if (settings.containsKey(Const.Interstitial.UseRewardedVideoAsInterstitialKey)) {
                    if ((boolean) settings.get(Const.Interstitial.UseRewardedVideoAsInterstitialKey)) {

                        MsgTools.printMsg("loadInterstitial: " + placementId + ", is_use_rewarded_video_as_interstitial: " + true);
                        settings.put("is_use_rewarded_video_as_interstitial", true);
                    }
                }
            } catch (Throwable e) {
            }

            try {
                Map<String, Object> map = (Map<String, Object>) settings.get(Const.SIZE);
                if (map != null) {
                    int width = Utils.dip2px(mActivity, Double.parseDouble(map.get(Const.WIDTH).toString()));
                    int height = Utils.dip2px(mActivity, Double.parseDouble(map.get(Const.HEIGHT).toString()));

                    MsgTools.printMsg("loadInterstitial: " + placementId + ", width: " + width + ", height: " + height);

                    settings.put("key_width", width);
                    settings.put("key_height", height);
                }
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }

        mInterstitialAd.setLocalExtra(settings);
        mInterstitialAd.load();
    }

    public void showInterstitialAd(final String scenario) {
        MsgTools.printMsg("showInterstitialAd: " + mPlacementId + ", scenario: " + scenario);

        if (mInterstitialAd != null) {
            if (!TextUtils.isEmpty(scenario)) {
                mInterstitialAd.show(mActivity, scenario);
            } else {
                mInterstitialAd.show(mActivity);
            }
        }
    }

    public boolean isAdReady() {
        MsgTools.printMsg("interstitial isAdReady: " + mPlacementId);

        boolean isReady = false;
        if (mInterstitialAd != null) {
            isReady = mInterstitialAd.isAdReady();
        }

        MsgTools.printMsg("interstitial isAdReady: " + mPlacementId + ", " + isReady);
        return isReady;
    }

    public Map<String, Object> checkAdStatus() {
        MsgTools.printMsg("interstitial checkAdStatus: " + mPlacementId);

        Map<String, Object> map = new HashMap<>(5);

        if (mInterstitialAd != null) {
            ATAdStatusInfo atAdStatusInfo = mInterstitialAd.checkAdStatus();
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
        MsgTools.printMsg("interstitial checkValidAdCaches: " + mPlacementId);

        if (mInterstitialAd != null) {
            List<ATAdInfo> vaildAds = mInterstitialAd.checkValidAdCaches();
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

}
