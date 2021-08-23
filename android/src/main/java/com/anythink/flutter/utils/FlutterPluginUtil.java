package com.anythink.flutter.utils;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;


public class FlutterPluginUtil {

    public static Activity sActivity;

    public static void setActivity(Activity activity) {
        sActivity = activity;
    }

    public static Activity getActivity() {
        return sActivity;
    }

    public static Context getApplicationContext() {
        try {
            return sActivity.getApplicationContext();
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void runOnUiThread(final Runnable runnable) {
        try {
            if (Looper.getMainLooper() == Looper.myLooper()) {
                runnable.run();
            } else {
                getActivity().runOnUiThread(runnable);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
