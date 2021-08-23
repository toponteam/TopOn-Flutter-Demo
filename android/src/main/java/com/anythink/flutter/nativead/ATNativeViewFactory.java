package com.anythink.flutter.nativead;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class ATNativeViewFactory extends PlatformViewFactory {
    BinaryMessenger messenger;

    public ATNativeViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        return new ATAndroidNativeView(context, messenger, viewId, (Map<String, Object>) args);
    }
}
