package com.anythink.flutter.banner;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class ATBannerViewFactory extends PlatformViewFactory {
    BinaryMessenger messenger;

    public ATBannerViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        return new ATAndroidBannerView(context, messenger, viewId, (Map<String, Object>) args);
    }
}
