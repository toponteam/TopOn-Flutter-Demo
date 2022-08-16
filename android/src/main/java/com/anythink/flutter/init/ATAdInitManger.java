package com.anythink.flutter.init;

import androidx.annotation.NonNull;

import com.anythink.core.api.ATGDPRAuthCallback;
import com.anythink.core.api.ATSDK;
import com.anythink.core.api.NetTrafficeCallback;
import com.anythink.flutter.ATFlutterEventManager;
import com.anythink.flutter.HandleAnyThinkMethod;
import com.anythink.flutter.utils.Const;
import com.anythink.flutter.utils.FlutterPluginUtil;
import com.anythink.flutter.utils.MsgTools;

import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ATAdInitManger implements HandleAnyThinkMethod {

    private static class SingletonClassInstance {
        private static final ATAdInitManger instance = new ATAdInitManger();
    }

    public static ATAdInitManger getInstance() {
        return SingletonClassInstance.instance;
    }

    private ATAdInitManger() {
    }

    @Override
    public boolean handleMethodCall(@NonNull MethodCall methodCall, @NonNull final MethodChannel.Result result) throws Exception {

        switch (methodCall.method) {
            case "initAnyThinkSDK":
                String appID = methodCall.argument(Const.Init.APP_ID_STR);
                String appKey = methodCall.argument(Const.Init.APP_KEY_STR);

                MsgTools.printMsg("initSDK: " + appID + ", " + appKey);
                ATSDK.init(FlutterPluginUtil.getApplicationContext(), appID, appKey);
                break;
            case "setLogEnabled":
                Boolean logEnable = methodCall.argument(Const.Init.LOG_ENABLE);

                MsgTools.setLogDebug(logEnable);
                MsgTools.printMsg("setLogEnabled: " + logEnable);
                ATSDK.setNetworkLogDebug(logEnable);
                break;
            case "setChannelStr":
                String channelStr = methodCall.argument(Const.Init.CHANNEL_STR);

                MsgTools.printMsg("setChannelStr: " + channelStr);
                ATSDK.setChannel(channelStr);
                break;
            case "setSubchannelStr":
                String subchannelStr = methodCall.argument(Const.Init.SUB_CHANNEL_STR);

                MsgTools.printMsg("setSubchannelStr: " + subchannelStr);
                ATSDK.setSubChannel(subchannelStr);
                break;
            case "setCustomDataDic":
                Map<String, Object> argument = methodCall.argument(Const.Init.CUSTOM_DATA_DIC);
                if (argument != null) {
                    MsgTools.printMsg("setCustomDataDic: " + argument);
                    ATSDK.initCustomMap(argument);
                }
                break;
            case "setExludeBundleIDArray":
                MsgTools.printMsg("setExludeBundleIDArray");
                List<String> bundleIdList = methodCall.argument(Const.Init.EXLUDE_BUNDLE_ID_ARRAY);

                if (bundleIdList != null) {

                    int size = bundleIdList.size();
                    for (int i = 0; i < size; i++) {
                        MsgTools.printMsg("setExludeBundleIDArray: " + bundleIdList.get(i));
                    }

//                    ATSDK.setExcludeMyOfferPkgList(bundleIdList);
                    ATSDK.setExcludePackageList(bundleIdList);
                }
                break;
            case "deniedUploadDeviceInfo":
                MsgTools.printMsg("deniedUploadDeviceInfo");
                List<String> deniedUploadDeviceInfoList = methodCall.argument(Const.Init.DENIED_UPLOAD_INFO_ARRAY);

                if (deniedUploadDeviceInfoList != null) {

                    int size = deniedUploadDeviceInfoList.size();
                    if (size > 0) {
                        String[] deniedArray = new String[size];
                        String info;
                        for (int i = 0; i < size; i++) {
                            info = deniedUploadDeviceInfoList.get(i);
                            deniedArray[i] = info;
                            MsgTools.printMsg("deniedUploadDeviceInfo: " + info);
                        }

                        ATSDK.deniedUploadDeviceInfo(deniedArray);
                        break;
                    }
                }

                try {
                    MsgTools.printMsg("deniedUploadDeviceInfo: empty string");
                    ATSDK.deniedUploadDeviceInfo("");
                } catch (Throwable e) {
                    e.printStackTrace();
                }

                break;
            case "setPlacementCustomData":
                String placementIDStr = methodCall.argument(Const.Init.PLACEMENT_ID_STR);
                Map<String, Object> placementCustomDataMap = methodCall.argument(Const.Init.PLACEMENT_CUSTOM_DATA_DIC);

                MsgTools.printMsg("setPlacementCustomData: " + placementIDStr + ", " + placementCustomDataMap);
                ATSDK.initPlacementCustomMap(placementIDStr, placementCustomDataMap);
                break;
            case "getGDPRLevel":
                int gdprDataLevel = ATSDK.getGDPRDataLevel(FlutterPluginUtil.getApplicationContext());

                MsgTools.printMsg("getGDPRLevel: " + gdprDataLevel);

                String levelString;
                switch (gdprDataLevel) {
                    case ATSDK.PERSONALIZED:
                        levelString = "ATDataConsentSetPersonalized";
                        break;
                    case ATSDK.NONPERSONALIZED:
                        levelString = "ATDataConsentSetNonpersonalized";
                        break;
                    default:
                        levelString = "ATDataConsentSetUnknown";
                        break;
                }
                MsgTools.printMsg("getGDPRLevel: callback to flutter: " + levelString);
                result.success(levelString);
                break;
            case "getUserLocation":
                MsgTools.printMsg("getUserLocation");
                ATSDK.checkIsEuTraffic(FlutterPluginUtil.getApplicationContext(), new NetTrafficeCallback() {
                    @Override
                    public void onResultCallback(boolean b) {
                        MsgTools.printMsg("getUserLocation: onResultCallback: " + b);

                        final String result = b ? "1" : "2";
                        MsgTools.printMsg("getUserLocation: callback to flutter: result: " + result);
                        ATFlutterEventManager.getInstance().sendMsgToFlutter(Const.CallbackMethodCall.InitCallName, Const.InitCallback.locationCallbackKey, result);
                    }

                    @Override
                    public void onErrorCallback(String s) {
                        MsgTools.printMsg("getUserLocation: onErrorCallback: " + s);

                        ATFlutterEventManager.getInstance().sendMsgToFlutter(Const.CallbackMethodCall.InitCallName, Const.InitCallback.locationCallbackKey, "0");//unknown
                    }
                });
                break;
            case "setDataConsentSet":
                String uploadDataLevel = methodCall.argument(Const.Init.GDPR_UPLOAD_DATA_LEVEL);

                MsgTools.printMsg("setDataConsentSet: " + uploadDataLevel);

                int level;
                switch (uploadDataLevel) {
                    case "ATDataConsentSetPersonalized":
                        level = ATSDK.PERSONALIZED;
                        break;
                    case "ATDataConsentSetNonpersonalized":
                        level = ATSDK.NONPERSONALIZED;
                        break;
                    default:
                        level = ATSDK.UNKNOWN;
                        break;
                }

                ATSDK.setGDPRUploadDataLevel(FlutterPluginUtil.getApplicationContext(), level);
                break;
            case "showGDPRAuth":
                MsgTools.printMsg("showGDPRAuth");

                FlutterPluginUtil.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        ATSDK.showGdprAuth(FlutterPluginUtil.getApplicationContext(), new ATGDPRAuthCallback() {
                            @Override
                            public void onAuthResult(int i) {
                                MsgTools.printMsg("showGDPRAuth: onAuthResult: " + i);

                                String result;
                                switch (i) {
                                    case ATSDK.PERSONALIZED:
                                        result = "1";
                                        break;
                                    case ATSDK.NONPERSONALIZED:
                                        result = "2";
                                        break;
                                    default:
                                        result = "0";//unknown
                                        break;
                                }
                                MsgTools.printMsg("showGDPRAuth: onAuthResult: callback to flutter: result: " + result);
                                ATFlutterEventManager.getInstance().sendMsgToFlutter(Const.CallbackMethodCall.InitCallName, Const.InitCallback.consentSetCallbackKey, result);
                            }

                            @Override
                            public void onPageLoadFail() {
                                MsgTools.printMsg("showGDPRAuth: onPageLoadFail");

                                ATFlutterEventManager.getInstance().sendMsgToFlutter(Const.CallbackMethodCall.InitCallName, Const.InitCallback.consentSetCallbackKey, "0");//unknown
                            }
                        });
                    }
                });
                break;
        }
        return true;
    }
}
