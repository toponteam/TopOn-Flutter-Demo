package com.anythink.flutter.nativead;

import android.app.Activity;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.anythink.flutter.utils.MsgTools;
import com.anythink.flutter.utils.Utils;
import com.anythink.nativead.api.ATNativeImageView;
import com.anythink.nativead.api.ATNativeMaterial;
import com.anythink.nativead.api.ATNativePrepareExInfo;
import com.anythink.nativead.api.ATNativePrepareInfo;

import java.util.ArrayList;
import java.util.List;

public class SelfRenderViewUtil {

    Activity mActivity;
    ViewInfo mViewInfo;
    FrameLayout mFrameLayout;
    ImageView mDislikeView;
    int mNetworkType;
    
    public SelfRenderViewUtil(Activity pActivity, ViewInfo pViewInfo, int networkType) {
        mActivity = pActivity;
        mViewInfo = pViewInfo;
        mNetworkType = networkType;
    }

    public FrameLayout bindSelfRenderView(ATNativeMaterial adMaterial, ATNativePrepareInfo nativePrepareInfo, ViewInfo pViewInfo) {
        mFrameLayout = new FrameLayout(mActivity);
        FrameLayout frameLayout = new FrameLayout(mActivity);
        TextView titleView = new TextView(mActivity);
        TextView descView = new TextView(mActivity);
        TextView ctaView = new TextView(mActivity);

        //click views
        List<View> clickViewList = new ArrayList<>();
        //click
        List<View> customClickViews = new ArrayList<>();

        final View mediaView = adMaterial.getAdMediaView(frameLayout);

        if (pViewInfo.titleView != null) {

            if (!TextUtils.isEmpty(pViewInfo.titleView.textcolor)) {
                titleView.setTextColor(Color.parseColor(pViewInfo.titleView.textcolor));
            }

            if (pViewInfo.titleView.textSize > 0) {
                titleView.setTextSize(TypedValue.COMPLEX_UNIT_PX, pViewInfo.titleView.textSize);
            }
            MsgTools.printMsg("title---->" + adMaterial.getTitle());
            titleView.setText(adMaterial.getTitle());

            titleView.setSingleLine();
            titleView.setMaxEms(15);
            titleView.setEllipsize(TextUtils.TruncateAt.END);

            ViewInfo.add2ParentView(frameLayout, titleView, pViewInfo.titleView, -1);
            nativePrepareInfo.setTitleView(titleView);//bind title
        }


        if (pViewInfo.ctaView != null) {
            if (!TextUtils.isEmpty(pViewInfo.ctaView.textcolor)) {
                //                 MsgTools.pirntMsg("#"+Integer.toHexString(pViewInfo.ctaView.textcolor));
                //                ctaView.setTextColor(pViewInfo.ctaView.textcolor);
                ctaView.setTextColor(Color.parseColor(pViewInfo.ctaView.textcolor));
            }

            if (pViewInfo.ctaView.textSize > 0) {
                ctaView.setTextSize(TypedValue.COMPLEX_UNIT_PX, pViewInfo.ctaView.textSize);
            }


            ctaView.setGravity(Gravity.CENTER);
            ctaView.setSingleLine();
            ctaView.setMaxEms(15);
            ctaView.setEllipsize(TextUtils.TruncateAt.END);

            MsgTools.printMsg("cat---->" + adMaterial.getCallToActionText());
            ctaView.setText(adMaterial.getCallToActionText());

            ViewInfo.add2ParentView(frameLayout, ctaView, pViewInfo.ctaView, -1);
            nativePrepareInfo.setCtaView(ctaView);//bind cta button
        }


        if (pViewInfo.descView != null && descView != null) {

            if (!TextUtils.isEmpty(pViewInfo.descView.textcolor)) {
                descView.setTextColor(Color.parseColor(pViewInfo.descView.textcolor));

            }
            if (pViewInfo.descView.textSize > 0) {
                descView.setTextSize(TypedValue.COMPLEX_UNIT_PX, pViewInfo.descView.textSize);
            }
            MsgTools.printMsg("desc---->" + adMaterial.getDescriptionText());
            descView.setText(adMaterial.getDescriptionText());


            descView.setMaxLines(3);
            descView.setMaxEms(15);
            descView.setEllipsize(TextUtils.TruncateAt.END);

            ViewInfo.add2ParentView(frameLayout, descView, pViewInfo.descView, -1);
            nativePrepareInfo.setDescView(descView);//bind desc
        }

        ATNativeImageView iconView = null;
        if (pViewInfo.IconView != null) {

            FrameLayout iconArea = new FrameLayout(mActivity);

            View adIconView = adMaterial.getAdIconView();
            if (adIconView == null) {
                iconView = new ATNativeImageView(mActivity);
                iconArea.addView(iconView, new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
                iconView.setImage(adMaterial.getIconImageUrl());
            } else {
                iconArea.addView(adIconView, new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
            }

            // 加载图片
            ViewInfo.add2ParentView(frameLayout, iconArea, pViewInfo.IconView, -1);
            nativePrepareInfo.setIconView(iconView);//bind icon
        }


        if (mediaView != null) {
//            mediaView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            MsgTools.printMsg("mediaView ---> 视屏播放 " + adMaterial.getVideoUrl());
            if (pViewInfo.imgMainView != null) {
                ViewInfo.add2ParentView(frameLayout, mediaView, pViewInfo.imgMainView, -1);
            }
        } else {
            //加载大图
            MsgTools.printMsg("mediaView ---> 大图播放");
            if (pViewInfo.imgMainView != null) {
                final ATNativeImageView mainImageView = new ATNativeImageView(mActivity);
                ViewInfo.add2ParentView(frameLayout, mainImageView, pViewInfo.imgMainView, -1);
                mainImageView.setImage(adMaterial.getMainImageUrl());
                nativePrepareInfo.setMainImageView(mainImageView);//bind main image
            }
        }


        if (!TextUtils.isEmpty(adMaterial.getAdFrom()) && mNetworkType == 23) {
            FrameLayout.LayoutParams adFromParam = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT);
            adFromParam.leftMargin = Utils.dip2px(mActivity, 3);
            adFromParam.bottomMargin = Utils.dip2px(mActivity, 3);
            adFromParam.gravity = Gravity.BOTTOM;
            TextView adFromTextView = new TextView(mActivity);
            adFromTextView.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 6);
            adFromTextView.setPadding(Utils.dip2px(mActivity, 5), Utils.dip2px(mActivity, 2), Utils.dip2px(mActivity, 5), Utils.dip2px(mActivity, 2));
            adFromTextView.setBackgroundColor(0xff888888);
            adFromTextView.setTextColor(0xffffffff);
            adFromTextView.setText(adMaterial.getAdFrom());

            frameLayout.addView(adFromTextView, adFromParam);
            nativePrepareInfo.setAdFromView(adFromTextView);//bind ad from
        }


        ATNativeImageView logoView = null;
        if (pViewInfo.adLogoView != null) {
            logoView = new ATNativeImageView(mActivity);
            ViewInfo.add2ParentView(frameLayout, logoView, pViewInfo.adLogoView, -1);
            nativePrepareInfo.setAdLogoView(logoView);//bind ad choice
            logoView.setImage(adMaterial.getAdChoiceIconUrl());
            MsgTools.printMsg("adMaterial choice icon url == null:" + (adMaterial.getAdChoiceIconUrl() == null));

            if (TextUtils.isEmpty(adMaterial.getAdChoiceIconUrl())) {
                MsgTools.printMsg("start to add adMaterial label textview");
                TextView adLableTextView = new TextView(mActivity);
                adLableTextView.setTextColor(Color.WHITE);
                adLableTextView.setText("AD");
                adLableTextView.setTextSize(11);
                adLableTextView.setPadding(Utils.dip2px(mActivity, 3), 0, Utils.dip2px(mActivity, 3), 0);
                adLableTextView.setBackgroundColor(Color.parseColor("#66000000"));
                if (frameLayout != null) {
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    layoutParams.leftMargin = Utils.dip2px(mActivity, 3);
                    layoutParams.topMargin = Utils.dip2px(mActivity, 3);
                    frameLayout.addView(adLableTextView, layoutParams);

                    MsgTools.printMsg("add adMaterial label textview 2 activity");

                    nativePrepareInfo.setAdLogoView(adLableTextView);//bind ad choice
                }
            }
            FrameLayout.LayoutParams adLogoLayoutParams = new FrameLayout.LayoutParams(pViewInfo.adLogoView.mWidth, pViewInfo.adLogoView.mHeight);
            adLogoLayoutParams.leftMargin = pViewInfo.adLogoView.mX;
            adLogoLayoutParams.topMargin = pViewInfo.adLogoView.mY;
            nativePrepareInfo.setChoiceViewLayoutParams(adLogoLayoutParams);//bind layout params for adMaterial choice
        }

        if (pViewInfo.dislikeView != null) {
            initDislikeView(pViewInfo.dislikeView);
            ViewInfo.add2ParentView(frameLayout, mDislikeView, pViewInfo.dislikeView, -1);
            nativePrepareInfo.setCloseView(mDislikeView);//bind close button
        }

        if (pViewInfo.rootView != null) {
            dealWithClick(frameLayout, pViewInfo.rootView.isCustomClick, clickViewList, customClickViews, "root");
        }
        if (pViewInfo.titleView != null) {
            dealWithClick(titleView, pViewInfo.titleView.isCustomClick, clickViewList, customClickViews, "title");
        }
        if (pViewInfo.descView != null) {
            dealWithClick(descView, pViewInfo.descView.isCustomClick, clickViewList, customClickViews, "desc");
        }
        if (pViewInfo.IconView != null && iconView != null) {
            dealWithClick(iconView, pViewInfo.IconView.isCustomClick, clickViewList, customClickViews, "icon");
        }
        if (pViewInfo.adLogoView != null) {
            dealWithClick(logoView, pViewInfo.adLogoView.isCustomClick, clickViewList, customClickViews, "adLogo");
        }
        if (pViewInfo.ctaView != null) {
            dealWithClick(ctaView, pViewInfo.ctaView.isCustomClick, clickViewList, customClickViews, "cta");
        }


        nativePrepareInfo.setClickViewList(clickViewList);//bind click view list

        if (nativePrepareInfo instanceof ATNativePrepareExInfo) {
            ((ATNativePrepareExInfo) nativePrepareInfo).setCreativeClickViewList(customClickViews);//bind custom view list
        }

        return frameLayout;
    }

    private void initDislikeView(ViewInfo.INFO dislikeInfoView) {
        if (mDislikeView == null) {
            mDislikeView = new ImageView(mActivity);
            mDislikeView.setImageResource(Utils.getResId(mActivity, "btn_close", "drawable"));
        }

        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(dislikeInfoView.mWidth, dislikeInfoView.mHeight);
        layoutParams.leftMargin = dislikeInfoView.mX;
        layoutParams.topMargin = dislikeInfoView.mY;

        if (!TextUtils.isEmpty(dislikeInfoView.bgcolor)) {
            mDislikeView.setBackgroundColor(Color.parseColor(dislikeInfoView.bgcolor));
        }

        mDislikeView.setLayoutParams(layoutParams);
    }

    private void dealWithClick(View view, boolean isCustomClick, List<View> clickViews, List<View> customClickViews, String name) {
        if (mNetworkType == 8 || mNetworkType == 22) {
            if (isCustomClick) {
                if (view != null) {
                    MsgTools.printMsg("add customClick ----> " + name);
                    customClickViews.add(view);
                }
                return;
            }
        }
        if (view != null) {
            MsgTools.printMsg("add click ----> " + name);
            clickViews.add(view);
        }
    }

}
