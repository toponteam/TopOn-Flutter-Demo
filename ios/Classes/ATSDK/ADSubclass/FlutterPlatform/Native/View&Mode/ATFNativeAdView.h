//
//  ATFNativeAdView.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import <UIKit/UIKit.h>
#import <AnyThinkNative/AnyThinkNative.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFNativeAdView : ATNativeADView

// 广告商
@property(nonatomic, readonly) UILabel *advertiserLabel;
// 评级
@property(nonatomic, readonly) UILabel *ratingLabel;


/// 主标题
@property(nonatomic, readonly) UILabel *titleLabel;
/// 描述广告内容
@property(nonatomic, readonly) UILabel *textLabel;
/// 下载
@property(nonatomic, readonly) UILabel *ctaLabel;
/// 图标
@property(nonatomic, readonly) UIImageView *iconImageView;
/// 展示主图片
@property(nonatomic, readonly) UIImageView *mainImageView;
/// 广告标识
@property(nonatomic, readonly) UIImageView *logoImageView;
/// 关闭按钮
@property(nonatomic, readonly) UIButton *dislikeButton;

///  布局子控件
- (void)layoutChildControls;

///  渲染子控件
- (void)renderingChildControls:(NSDictionary *)extraDic;
@end



NS_ASSUME_NONNULL_END
