package com.anythink.flutter.utils;

import android.util.Log;


public class MsgTools {
    public static final String TAG = "ATFlutterBridge";
    public static boolean isDebug = true;

    public static void printMsg(String msg) {
        if (isDebug) {
            Log.e(TAG, msg);
        }
    }

    public static void setLogDebug(boolean debug) {
        isDebug = debug;
    }

}
