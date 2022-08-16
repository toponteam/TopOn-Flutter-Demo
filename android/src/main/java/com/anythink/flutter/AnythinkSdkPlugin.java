package com.anythink.flutter;

import androidx.annotation.NonNull;

import com.anythink.flutter.utils.FlutterPluginUtil;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

/**
 * AnythinkSdkPlugin
 */
public class AnythinkSdkPlugin implements FlutterPlugin, ActivityAware {

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        //init event manager
        ATFlutterEventManager.getInstance().init(flutterPluginBinding.getBinaryMessenger());
        //init platformView manager
        ATPlatformViewManager.getInstance().init(flutterPluginBinding);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        //release
        ATFlutterEventManager.getInstance().release();
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding activityPluginBinding) {
        FlutterPluginUtil.setActivity(activityPluginBinding.getActivity());
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding activityPluginBinding) {

    }

    @Override
    public void onDetachedFromActivity() {

    }
}
