package com.anythink.flutter.utils;

import android.content.Context;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Utils {
    public static boolean checkMethodInArray(String[] methodArray, String methodName) {
        for (String method : methodArray) {
            if (method.equals(methodName))
                return true;
        }
        return false;
    }

    public static int dip2px(Context context, double dipValue) {
        float scale = context.getResources().getDisplayMetrics().density;
        return (int) (dipValue * scale + 0.5);
    }

    public static Map<String, Object> jsonStrToMap(String jsonStr) throws JSONException {
        Map<String, Object> data = new HashMap<>();
        try {
            JSONObject jsonObject = new JSONObject(jsonStr);
            Iterator<String> keys = jsonObject.keys();
            String key;
            while (keys.hasNext()) {
                key = keys.next();
                Object value = jsonObject.opt(key);

                if (value instanceof JSONObject) {
                    try {
                        data.put(key, ((JSONObject) value).toString());
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                } else if (value instanceof Map) {
                    try {
                        data.put(key, new JSONObject(((Map) value).toString()));
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                } else {
                    data.put(key, value);
                }
            }
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return data;
    }

    public static int getResId(Context context, String resName, String resType) {
        if (context != null) {
            resName = "anythink_" + resName;
            return context.getResources().getIdentifier(resName, resType,
                    context.getPackageName());
        }
        return -1;
    }

    public static String mapToJsonString(Map<String, Object> map) {
        try {
            return new JSONObject(map).toString();
        } catch (Throwable e) {
        }
        return "";
    }
}
