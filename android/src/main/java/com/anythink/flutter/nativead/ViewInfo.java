package com.anythink.flutter.nativead;

import android.app.Activity;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import com.anythink.flutter.utils.Const;
import com.anythink.flutter.utils.FlutterPluginUtil;
import com.anythink.flutter.utils.MsgTools;
import com.anythink.flutter.utils.Utils;
import com.anythink.nativead.api.ATNativeAdView;

import java.util.Map;

public class ViewInfo {
    public INFO rootView, imgMainView, IconView, titleView, descView, adLogoView, ctaView, dislikeView;

    protected static class INFO {
        protected int mX = 0;
        protected int mY = 0;
        protected int mWidth = 0;
        protected int mHeight = 0;
        protected String bgcolor = "";
        protected int textSize = 0;
        protected String textcolor = "";
        protected boolean isCustomClick = false;

        protected String name;

        public INFO() {

        }
    }


    public static ViewInfo createDefualtView(Activity pActivity) {


        DisplayMetrics dm = pActivity.getResources().getDisplayMetrics();
        int heigth = dm.heightPixels;
        int width = dm.widthPixels;

        ViewInfo _viewInfo = new ViewInfo();
        _viewInfo.rootView = new INFO();
        _viewInfo.imgMainView = new INFO();
        _viewInfo.IconView = new INFO();
        _viewInfo.titleView = new INFO();
        _viewInfo.descView = new INFO();
        _viewInfo.adLogoView = new INFO();
        _viewInfo.ctaView = new INFO();


        _viewInfo.rootView.textSize = 12;
        _viewInfo.rootView.textcolor = "#000000";
        _viewInfo.rootView.bgcolor = "#FFFFFF";
        _viewInfo.rootView.mWidth = width;
        _viewInfo.rootView.mHeight = heigth / 5;
        _viewInfo.rootView.mX = 0;
        _viewInfo.rootView.mY = 0;
        _viewInfo.rootView.name = "rootView_def";

        //imgMainView
        _viewInfo.imgMainView.textSize = 12;
        _viewInfo.imgMainView.textcolor = "#000000";
        _viewInfo.imgMainView.bgcolor = "#FFFFFF";
        _viewInfo.imgMainView.mWidth = 25;
        _viewInfo.imgMainView.mHeight = 25;
        _viewInfo.imgMainView.mX = _viewInfo.rootView.mX + 0;
        _viewInfo.imgMainView.mY = _viewInfo.rootView.mX + 0;
        _viewInfo.imgMainView.name = "imgMainView_def";


        _viewInfo.adLogoView.textSize = 12;
        _viewInfo.adLogoView.textcolor = "#000000";
        _viewInfo.adLogoView.bgcolor = "#FFFFFF";
        _viewInfo.adLogoView.mWidth = _viewInfo.rootView.mWidth * 3 / 5;
        _viewInfo.adLogoView.mHeight = _viewInfo.rootView.mHeight / 2;
        _viewInfo.adLogoView.mX = _viewInfo.rootView.mX + 100;
        _viewInfo.adLogoView.mY = _viewInfo.rootView.mX + 10;
        _viewInfo.adLogoView.name = "adlogo_def";


        _viewInfo.IconView.textSize = 12;
        _viewInfo.IconView.textcolor = "#000000";
        _viewInfo.IconView.bgcolor = "#FFFFFF";
        _viewInfo.IconView.mWidth = 25;
        _viewInfo.IconView.mHeight = 25;
        _viewInfo.IconView.mX = _viewInfo.rootView.mX + 0;
        _viewInfo.IconView.mY = _viewInfo.rootView.mX + 0;
        _viewInfo.IconView.name = "appicon_def";


        _viewInfo.titleView.textSize = 12;
        _viewInfo.titleView.textcolor = "#000000";
        _viewInfo.titleView.bgcolor = "#FFFFFF";
        _viewInfo.titleView.mWidth = 25;
        _viewInfo.titleView.mHeight = 25;
        _viewInfo.titleView.mX = _viewInfo.rootView.mX + 0;
        _viewInfo.titleView.mY = _viewInfo.rootView.mX + 0;


        _viewInfo.descView.textSize = 12;
        _viewInfo.descView.textcolor = "#000000";
        _viewInfo.descView.bgcolor = "#FFFFFF";
        _viewInfo.descView.mWidth = 25;
        _viewInfo.descView.mHeight = 25;
        _viewInfo.descView.mX = _viewInfo.rootView.mX + 0;
        _viewInfo.descView.mY = _viewInfo.rootView.mX + 0;
        _viewInfo.descView.name = "desc_def";

        _viewInfo.ctaView.textSize = 12;
        _viewInfo.ctaView.textcolor = "#000000";
        _viewInfo.ctaView.bgcolor = "#FFFFFF";
        _viewInfo.ctaView.mWidth = 25;
        _viewInfo.ctaView.mHeight = 25;
        _viewInfo.ctaView.mX = _viewInfo.rootView.mX + 0;
        _viewInfo.ctaView.mY = _viewInfo.rootView.mX + 0;
        _viewInfo.ctaView.name = "cta_def";

        return _viewInfo;
    }

    public INFO parseINFO(Map<String, Object> settingsMap, String name, int px, int py) {
        INFO _info = new INFO();
        if (settingsMap.containsKey(Const.X)) {
            _info.mX = Utils.dip2px(FlutterPluginUtil.getActivity(), (double) settingsMap.get(Const.X)) + px;
            MsgTools.printMsg("parseINFO: name: " + name + " x -> " + _info.mX);
        }

        if (settingsMap.containsKey(Const.Y)) {
            _info.mY = Utils.dip2px(FlutterPluginUtil.getActivity(), (double) settingsMap.get(Const.Y)) + py;
            MsgTools.printMsg("parseINFO: name: " + name + " y -> " + _info.mY);

        }
        if (settingsMap.containsKey(Const.WIDTH)) {
            _info.mWidth = Utils.dip2px(FlutterPluginUtil.getActivity(), (double) settingsMap.get(Const.WIDTH));
            MsgTools.printMsg("parseINFO: name:" + name + " width -> " + _info.mWidth);

        }
        if (settingsMap.containsKey(Const.HEIGHT)) {
            _info.mHeight = Utils.dip2px(FlutterPluginUtil.getActivity(), (double) settingsMap.get(Const.HEIGHT));
            MsgTools.printMsg("parseINFO: name:" + name + " height -> " + _info.mHeight);

        }
        if (settingsMap.containsKey(Const.BACKGROUND_COLOR)) {
            _info.bgcolor = (String) settingsMap.get(Const.BACKGROUND_COLOR);
            MsgTools.printMsg("parseINFO: name:" + name + " bgColor ->" + _info.bgcolor);

        }
        if (settingsMap.containsKey(Const.TEXT_COLOR)) {
            _info.textcolor = (String) settingsMap.get(Const.TEXT_COLOR);
            MsgTools.printMsg("parseINFO: name:" + name + " text_color -> " + _info.textcolor);

        }
        if (settingsMap.containsKey(Const.TEXT_SIZE)) {
            _info.textSize = Utils.dip2px(FlutterPluginUtil.getActivity(), (double) settingsMap.get(Const.TEXT_SIZE));
            MsgTools.printMsg("parseINFO: name:" + name + " text_size -> " + _info.textSize);

        }
        if (settingsMap.containsKey(Const.CUSTOM_CLICK)) {
            _info.isCustomClick = (boolean) settingsMap.get(Const.CUSTOM_CLICK);
            MsgTools.printMsg("parseINFO: name:" + name + " custom_click -> " + _info.isCustomClick);

        }

        _info.name = name;
        return _info;
    }

    public static void add2ParentView(final FrameLayout view, final View childView, final INFO pViewInfo, final int gravity) {
        if (view == null || pViewInfo == null) {
            return;
        }

        if (childView == null || pViewInfo.mWidth < 0 ||  (pViewInfo.mHeight < 0 && pViewInfo.mHeight != ViewGroup.LayoutParams.WRAP_CONTENT)) {
            Log.e("add2activity--[" + pViewInfo.name + "]", " config error ,show error !");
            return;
        }


        Log.i("add2activity", "[" + pViewInfo.name + "]   add 2 activity");
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(pViewInfo.mWidth, pViewInfo.mHeight);
        layoutParams.leftMargin = pViewInfo.mX;
        layoutParams.topMargin = pViewInfo.mY;
        if (gravity > 0) {
            layoutParams.gravity = gravity;
        } else {
            layoutParams.gravity = 51;
        }


        childView.setLayoutParams(layoutParams);

//                pViewInfo.mView.setBackgroundColor(pViewInfo.bgcolor);
        try {
            if (!TextUtils.isEmpty(pViewInfo.bgcolor)) {
                MsgTools.printMsg("setBackgroundColor : " + pViewInfo.bgcolor);
                childView.setBackgroundColor(Color.parseColor(pViewInfo.bgcolor));

            } else {
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        view.addView(childView, layoutParams);

    }


    public static void addNativeAdView2Activity(final Activity pActivity, final ViewInfo pViewInfo, final ATNativeAdView mATNativeAdView, final int parentGravity) {

        if (pActivity == null || mATNativeAdView == null) {
            MsgTools.printMsg("pActivity or native ad view is null");
            return;
        }

        pActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    ViewGroup _viewGroup = (ViewGroup) mATNativeAdView.getParent();
                    if (_viewGroup != null) {
                        _viewGroup.removeView(mATNativeAdView);
                    }
                } catch (Exception e) {
                    e.printStackTrace();

                }

                if(pViewInfo.rootView != null){
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(pViewInfo.rootView.mWidth, pViewInfo.rootView.mHeight);

                    if (parentGravity != -1) {
                        layoutParams.gravity = parentGravity;
                    } else {
                        layoutParams.leftMargin = pViewInfo.rootView.mX;
                        layoutParams.topMargin = pViewInfo.rootView.mY;
                    }

                    if(!TextUtils.isEmpty(pViewInfo.rootView.bgcolor)){
                        mATNativeAdView.setBackgroundColor(Color.parseColor(pViewInfo.rootView.bgcolor));
                    }

                    MsgTools.printMsg("Add native view to content start....");
                    pActivity.addContentView(mATNativeAdView, layoutParams);
                    MsgTools.printMsg("Add native view to content end....");
                } else {
                    MsgTools.printMsg("pViewInfo.rootView is null");
                }


            }
        });
    }

}
