package com.anythink.flutter.nativead;

import android.content.Context;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.anythink.flutter.utils.MsgTools;
import com.anythink.flutter.utils.Utils;
import com.anythink.nativead.api.ATNativeAdRenderer;
import com.anythink.nativead.api.ATNativeImageView;
import com.anythink.nativead.unitgroup.api.CustomNativeAd;

import java.util.ArrayList;
import java.util.List;

@Deprecated
public class NativeRender implements ATNativeAdRenderer<CustomNativeAd> {

    Context mContext;
    FrameLayout mDevelopView;
    int mNetworkFirmId;
    View mDislikeView;
    ViewInfo mViewInfo;
    List<View> mClickViews = new ArrayList<>();

    public NativeRender(Context context, ViewInfo viewInfo) {
        mContext = context;
        mViewInfo = viewInfo;
    }

    @Override
    public View createView(Context context, int networkFirmId) {

        mDevelopView = new FrameLayout(context);
        return mDevelopView;
    }

    @Override
    public void renderAdView(View view, CustomNativeAd ad) {

        TextView titleView = new TextView(mContext);
        TextView descView = new TextView(mContext);
        TextView ctaView = new TextView(mContext);

        final View mediaView = ad.getAdMediaView(mDevelopView, view.getWidth());

        MsgTools.printMsg("isNativeExpress---->" + ad.isNativeExpress());
        if (mediaView != null && ad.isNativeExpress()) { // Template View

            if (mDislikeView != null) {
                mDislikeView.setVisibility(View.GONE);
            }

            if (mViewInfo.imgMainView != null && mViewInfo.rootView != null) {

                mViewInfo.imgMainView.mX = 0;
                mViewInfo.imgMainView.mY = 0;
                mViewInfo.imgMainView.mWidth = mViewInfo.rootView.mWidth;
                mViewInfo.imgMainView.mHeight = mViewInfo.rootView.mHeight;

                ViewInfo.add2ParentView(mDevelopView, mediaView, mViewInfo.imgMainView, -1);
                return;
            }
        }

        if (mViewInfo.rootView != null) {
            if (mViewInfo.rootView.mWidth != 0 && mViewInfo.rootView.mHeight != 0) {
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) view.getLayoutParams();
                layoutParams.width = mViewInfo.rootView.mWidth;
                layoutParams.height = mViewInfo.rootView.mHeight;
                view.setLayoutParams(layoutParams);
            }
//            if (!TextUtils.isEmpty(mViewInfo.rootView.bgcolor)) {
//                view.setBackgroundColor(Color.parseColor(mViewInfo.rootView.bgcolor));
//            }
        }


        if (mViewInfo.titleView != null) {

            if (!TextUtils.isEmpty(mViewInfo.titleView.textcolor)) {
                titleView.setTextColor(Color.parseColor(mViewInfo.titleView.textcolor));
            }

            if (mViewInfo.titleView.textSize > 0) {
                titleView.setTextSize(TypedValue.COMPLEX_UNIT_PX, mViewInfo.titleView.textSize);
            }

            titleView.setText(ad.getTitle());

            titleView.setSingleLine();
            titleView.setMaxEms(15);
            titleView.setEllipsize(TextUtils.TruncateAt.END);


            ViewInfo.add2ParentView(mDevelopView, titleView, mViewInfo.titleView, -1);

        }

        if (mViewInfo.descView != null && descView != null) {



            if (!TextUtils.isEmpty(mViewInfo.descView.textcolor)) {
                descView.setTextColor(Color.parseColor(mViewInfo.descView.textcolor));

            }
            if (mViewInfo.descView.textSize > 0) {
                descView.setTextSize(TypedValue.COMPLEX_UNIT_PX, mViewInfo.descView.textSize);
            }
            MsgTools.printMsg("desc---->" + ad.getDescriptionText());
            descView.setText(ad.getDescriptionText());


            descView.setMaxLines(3);
            descView.setMaxEms(15);
            descView.setEllipsize(TextUtils.TruncateAt.END);

            ViewInfo.add2ParentView(mDevelopView, descView, mViewInfo.descView, -1);
        }

        ATNativeImageView iconView = null;
        if (mViewInfo.IconView != null) {

            FrameLayout iconArea = new FrameLayout(mContext);


            if (ad.getAdIconView() == null) {
                iconView = new ATNativeImageView(mContext);
                iconArea.addView(iconView, new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
                iconView.setImage(ad.getIconImageUrl());
            } else {
                iconArea.addView(ad.getAdIconView(), new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
            }

            // 加载图片
            ViewInfo.add2ParentView(mDevelopView, iconArea, mViewInfo.IconView, -1);
        }

        if (mViewInfo.ctaView != null) {

            if (!TextUtils.isEmpty(mViewInfo.ctaView.textcolor)) {
                //                 MsgTools.pirntMsg("#"+Integer.toHexString(mViewInfo.ctaView.textcolor));
                //                ctaView.setTextColor(mViewInfo.ctaView.textcolor);
                ctaView.setTextColor(Color.parseColor(mViewInfo.ctaView.textcolor));
            }

            if (mViewInfo.ctaView.textSize > 0) {
                ctaView.setTextSize(TypedValue.COMPLEX_UNIT_PX, mViewInfo.ctaView.textSize);
            }


            ctaView.setGravity(Gravity.CENTER);
            ctaView.setSingleLine();
            ctaView.setMaxEms(15);
            ctaView.setEllipsize(TextUtils.TruncateAt.END);


            ctaView.setText(ad.getCallToActionText());
            ViewInfo.add2ParentView(mDevelopView, ctaView, mViewInfo.ctaView, -1);
        }


        ATNativeImageView logoView = null;
        if (mViewInfo.adLogoView != null) {
            // 加载图片
            logoView = new ATNativeImageView(mContext);
            ViewInfo.add2ParentView(mDevelopView, logoView, mViewInfo.adLogoView, -1);
            logoView.setImage(ad.getAdChoiceIconUrl());
        }

        if (mediaView != null) {
//            mediaView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            MsgTools.printMsg("mediaView ---> 视屏播放 " + ad.getVideoUrl());
            if (mViewInfo.imgMainView != null) {
                ViewInfo.add2ParentView(mDevelopView, mediaView, mViewInfo.imgMainView, -1);
            }
        } else {
            //加载大图
            MsgTools.printMsg("mediaView ---> 大图播放");
            final ATNativeImageView mainImageView = new ATNativeImageView(mContext);
            if (mViewInfo.imgMainView != null) {
                ViewInfo.add2ParentView(mDevelopView, mainImageView, mViewInfo.imgMainView, -1);
                mainImageView.setImage(ad.getMainImageUrl());
            }
        }


        if (!TextUtils.isEmpty(ad.getAdFrom()) && mNetworkFirmId == 23) {
            FrameLayout.LayoutParams adFromParam = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT);
            adFromParam.leftMargin = Utils.dip2px(mContext, 3);
            adFromParam.bottomMargin = Utils.dip2px(mContext, 3);
            adFromParam.gravity = Gravity.BOTTOM;
            TextView adFromTextView = new TextView(mContext);
            adFromTextView.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 6);
            adFromTextView.setPadding(Utils.dip2px(mContext, 5), Utils.dip2px(mContext, 2), Utils.dip2px(mContext, 5), Utils.dip2px(mContext, 2));
            adFromTextView.setBackgroundColor(0xff888888);
            adFromTextView.setTextColor(0xffffffff);
            adFromTextView.setText(ad.getAdFrom());

            mDevelopView.addView(adFromTextView, adFromParam);
        }

        if (mNetworkFirmId == 2) {
            MsgTools.printMsg("start to add admob ad textview ");
            TextView adLogoView = new TextView(mContext);
            adLogoView.setTextColor(Color.WHITE);
            adLogoView.setText("AD");
            adLogoView.setTextSize(11);
            adLogoView.setPadding(Utils.dip2px(mContext, 3), 0, Utils.dip2px(mContext, 3), 0);
            adLogoView.setBackgroundColor(Color.parseColor("#66000000"));
            if (mDevelopView != null) {
                FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                layoutParams.leftMargin = Utils.dip2px(mContext, 3);
                layoutParams.topMargin = Utils.dip2px(mContext, 3);
                mDevelopView.addView(adLogoView, layoutParams);

                MsgTools.printMsg("add admob ad textview 2 activity");
            }
        }

        //click
        List<View> customClickViews = new ArrayList<>();

        if (mViewInfo.rootView != null) {
            dealWithClick(view, mViewInfo.rootView.isCustomClick, mClickViews, customClickViews, "root");
        }
        if (mViewInfo.titleView != null) {
            dealWithClick(titleView, mViewInfo.titleView.isCustomClick, mClickViews, customClickViews, "title");
        }
        if (mViewInfo.descView != null) {
            dealWithClick(descView, mViewInfo.descView.isCustomClick, mClickViews, customClickViews, "desc");
        }
        if (mViewInfo.IconView != null) {
            dealWithClick(iconView, mViewInfo.IconView.isCustomClick, mClickViews, customClickViews, "icon");
        }
        if (mViewInfo.adLogoView != null) {
            dealWithClick(logoView, mViewInfo.adLogoView.isCustomClick, mClickViews, customClickViews, "adLogo");
        }
        if (mViewInfo.ctaView != null) {
            dealWithClick(ctaView, mViewInfo.ctaView.isCustomClick, mClickViews, customClickViews, "cta");
        }

        //dislike

        if (mDislikeView != null) {
            MsgTools.printMsg("bind dislike ----> " + mNetworkFirmId);

            mDislikeView.setVisibility(View.VISIBLE);

            CustomNativeAd.ExtraInfo.Builder builder = new CustomNativeAd.ExtraInfo.Builder();
            builder.setCloseView(mDislikeView);

            if (customClickViews.size() > 0) {
                builder.setCustomViewList(customClickViews);
            }

            ad.setExtraInfo(builder.build());
        } else {
            if (customClickViews.size() > 0) {
                CustomNativeAd.ExtraInfo.Builder builder = new CustomNativeAd.ExtraInfo.Builder()
                        .setCustomViewList(customClickViews);

                ad.setExtraInfo(builder.build());
            }
        }

    }

    public void setDislikeView(View dislikeView) {
        this.mDislikeView = dislikeView;
    }

    private void dealWithClick(View view, boolean isCustomClick, List<View> clickViews, List<View> customClickViews, String name) {
        if (mNetworkFirmId == 8 || mNetworkFirmId == 22) {
            if (isCustomClick) {
                if (view != null) {
                    customClickViews.add(view);
                }
                return;
            }
        }
        if (view != null) {
            clickViews.add(view);
        }
    }


    public List<View> getClickViews() {
        return mClickViews;
    }

}
