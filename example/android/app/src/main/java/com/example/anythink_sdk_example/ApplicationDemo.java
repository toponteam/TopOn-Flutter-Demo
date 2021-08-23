package com.example.anythink_sdk_example;

import android.app.Application;
import android.os.Build;
import android.util.Log;
import android.webkit.WebView;

public class ApplicationDemo extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        
        Log.e("TAG", "onCreate: ApplicationDemo");
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            String processMame = getProcessName();
            if (!getPackageName().equals(processMame)) {
                WebView.setDataDirectorySuffix(processMame);
            }
        }
    }
}
