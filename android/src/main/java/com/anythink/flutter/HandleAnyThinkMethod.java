package com.anythink.flutter;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public interface HandleAnyThinkMethod {
    boolean handleMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) throws Exception;
}
