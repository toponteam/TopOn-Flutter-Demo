//
//  ATFNativeManger.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFNativeManger.h"
#import <AnyThinkNative/AnyThinkNative.h>
#import "ATFCommonTool.h"
#import "ATFConfiguration.h"

#import "ATFSendSignalManger.h"
#import "ATFDisposeDataTool.h"
#import <Masonry/Masonry.h>
#import "ATFNativeSelfRenderView.h"
#define NativeCallName  @"NativeCall"


#define NativeAdFailToLoadAD  @"nativeAdFailToLoadAD"
#define NativeAdDidFinishLoading  @"nativeAdDidFinishLoading"
#define NativeAddidClick  @"nativeAdDidClick"
#define NativeAdDidDeepLink  @"nativeAdDidDeepLink"
#define NativeAddidEndPlayingVideo  @"nativeAdDidEndPlayingVideo"
#define NativeAdEnterFullScreenVideo  @"nativeAdEnterFullScreenVideo"
#define NativeAdExitFullScreenVideoInAd  @"nativeAdExitFullScreenVideoInAd"
#define NativeAddidShowNativeAd  @"nativeAdDidShowNativeAd"
#define NativeAddidStartPlayingVideo  @"nativeAdDidStartPlayingVideo"
#define NativeAddidTapCloseButton  @"nativeAdDidTapCloseButton"
#define NativeAdDidCloseDetailInAdView  @"nativeAdDidCloseDetailInAdView"

#define NativeAddidLoadSuccessDraw  @"nativeAdDidLoadSuccessDraw"

@interface ATFNativeManger()<ATNativeADDelegate>
@property(nonatomic,strong) UIButton * container;
@property(nonatomic,copy)NSString * placementID;
@property (nonatomic,strong) NSMutableDictionary *nativeViewDic;

@end

@implementation ATFNativeManger

/// 加载原生广告
- (void)loadNativeWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic{

    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:NativeSize];
    BOOL isAdaptiveHeight = [extraDic[IsAdaptiveHeight] boolValue];
    
    [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:@
     {
    kATExtraNativeIconImageSizeKey: @(AT_SIZE_72X72),
    kATExtraStartAPPNativeMainImageSizeKey:@(AT_SIZE_1200X628),
        kATExtraInfoNativeAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(parentMode.width, parentMode.height)]
        ,kATNativeAdSizeToFitKey:@(isAdaptiveHeight)
    } delegate:self];
}

/// 展示原生广告
- (void)showNative:(NSString *)placementID isAdaptiveHeight:(BOOL)isAdaptiveHeight extraDic:(NSDictionary *) extraDic{

    ATNativeADConfiguration *config = [self getATNativeADConfiguration:extraDic isAdaptiveHeight:isAdaptiveHeight];

    ATNativeAdOffer *offer = [[ATAdManager sharedManager] getNativeAdOfferWithPlacementID:placementID];
    
    ATFNativeSelfRenderView *selfRenderView = [self getSelfRenderViewOffer:offer];
     ATNativeADView *adView = [self getNativeADView:config offer:offer selfRenderView:selfRenderView withPlacementId:placementID];
    
    [selfRenderView setUIWidget:extraDic];

    [self prepareWithNativePrepareInfo:selfRenderView nativeADView:adView];
    
    [offer rendererWithConfiguration:config selfRenderView:selfRenderView nativeADView:adView];
            
    if (adView != nil) {
        [self removeNativeAdView:placementID];
        
        self.nativeViewDic[placementID] = adView;
    }

    [self addNativeView:extraDic placementID:placementID];
}

- (ATFNativeSelfRenderView *)getSelfRenderViewOffer:(ATNativeAdOffer *)offer{
    
    ATFNativeSelfRenderView *selfRenderView = [[ATFNativeSelfRenderView alloc]initWithOffer:offer];
            
    
    return selfRenderView;
}

#define kNavigationBarHeight ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown ? ([[UIApplication sharedApplication]statusBarFrame].size.height + 44) : ([[UIApplication sharedApplication]statusBarFrame].size.height - 4))

/// 展示场景原生广告
- (void)showNative:(NSString *)placementID sceneID:(NSString *)sceneID isAdaptiveHeight:(BOOL)isAdaptiveHeight extraDic:(NSDictionary *) extraDic{

    ATNativeADConfiguration *config = [self getATNativeADConfiguration:extraDic isAdaptiveHeight:isAdaptiveHeight];

    ATNativeAdOffer *offer = [[ATAdManager sharedManager] getNativeAdOfferWithPlacementID:placementID];
    
    ATFNativeSelfRenderView *selfRenderView = [self getSelfRenderViewOffer:offer];
    
    ATNativeADView *adView = [self getNativeADView:config offer:offer selfRenderView:selfRenderView withPlacementId:placementID] ;
    
    [offer rendererWithConfiguration:config selfRenderView:selfRenderView nativeADView:adView];
            
    if (adView != nil) {
        [self removeNativeAdView:placementID];

        self.nativeViewDic[placementID] = adView;
    }

    [self addNativeView:extraDic placementID:placementID];
}


- (ATNativeADView *)getNativeADView:(ATNativeADConfiguration *)config offer:(ATNativeAdOffer *)offer selfRenderView:(ATFNativeSelfRenderView *)selfRenderView withPlacementId:(NSString*)placementID{
    
    ATNativeADView *nativeADView = [[ATNativeADView alloc]initWithConfiguration:config currentOffer:offer placementID:placementID];
    
    
    UIView *mediaView = [nativeADView getMediaView];

    NSMutableArray *array = [@[selfRenderView.iconImageView,selfRenderView.titleLabel,selfRenderView.textLabel,selfRenderView.ctaLabel,selfRenderView.mainImageView] mutableCopy];
    
    if (mediaView) {
        [array addObject:mediaView];
    }
    
    [nativeADView registerClickableViewArray:array];
    
    
    selfRenderView.mediaView = mediaView;
    
    [selfRenderView addSubview:mediaView];

//    [mediaView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.equalTo(selfRenderView);
//            make.top.equalTo(selfRenderView.mainImageView.mas_top);
//    }];


    
    
    return nativeADView;
}


- (void)prepareWithNativePrepareInfo:(ATFNativeSelfRenderView *)selfRenderView nativeADView:(ATNativeADView *)nativeADView{
    
    ATNativePrepareInfo *info = [ATNativePrepareInfo loadPrepareInfo:^(ATNativePrepareInfo * _Nonnull prepareInfo) {
        prepareInfo.textLabel = selfRenderView.textLabel;
        prepareInfo.advertiserLabel = selfRenderView.advertiserLabel;
        prepareInfo.titleLabel = selfRenderView.titleLabel;
        prepareInfo.ratingLabel = selfRenderView.ratingLabel;
        prepareInfo.iconImageView = selfRenderView.iconImageView;
        prepareInfo.mainImageView = selfRenderView.mainImageView;
        prepareInfo.logoImageView = selfRenderView.logoImageView;
        prepareInfo.dislikeButton = selfRenderView.dislikeButton;
        prepareInfo.ctaLabel = selfRenderView.ctaLabel;
        prepareInfo.mediaView = selfRenderView.mediaView;
    }];
    
    [nativeADView prepareWithNativePrepareInfo:info];
}

/// 移除原生广告
- (void)removeNative:(NSString *)placementID {
    [self removeNativeAdView:placementID];
}


#pragma mark - ATNativeADDelegate
// 广告加载失败
- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:NativeAdFailToLoadAD placementID:placementID extraDic:nil error:error];
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];

    ATFLog(@"原生广告加载失败%@",error);
}

// 广告加载成功
- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {


    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic: NativeAdDidFinishLoading placementID:placementID extraDic:nil];

    [SendEventManger sendMethod:NativeCallName arguments:dic result:nil];
    ATFLog(@"原生广告加载成功");
}

// 广告点击
- (void)didClickNativeAdInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidClick placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];

    ATFLog(@"原生广告点击");
}

// 广告点击跳转是否为Deeplink形式，目前只针对TopOn Adx的广告返回
- (void)didDeepLinkOrJumpInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdDidDeepLink placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"原生广告点击跳转是否为Deeplink形式");
}

// 广告视频结束播放，部分广告平台有此回调
- (void)didEndPlayingVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidEndPlayingVideo placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"原生广告视频结束播放，部分广告平台有此回调");
}

// 广告进入全屏播放
- (void)didEnterFullScreenVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdEnterFullScreenVideo placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"原生广告进入全屏播放");
}

// 离开全屏播放
- (void)didExitFullScreenVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdExitFullScreenVideoInAd placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
    ATFLog(@"原生广告离开全屏播放");
}

// 广告展示成功
- (void)didShowNativeAdInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidShowNativeAd placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
    ATFLog(@"原生广告展示成功");
}

// 广告视频开始播放，部分广告平台有此回调
- (void)didStartPlayingVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidStartPlayingVideo placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
    ATFLog(@"原生广告视频开始播放，部分广告平台有此回调");
}

// 广告关闭按钮被点击，部分广告平台有此回调
- (void)didTapCloseButtonInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidTapCloseButton placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    [self removeNativeAdView:placementID];
    ATFLog(@"原生广告关闭按钮被点击，部分广告平台有此回调");
}

- (void)didLoadSuccessDrawWith:(NSArray *)views placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidLoadSuccessDraw placementID:placementID extraDic:extra];
    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    ATFLog(@"原生广告加载Draw成功");
}

- (void)didCloseDetailInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {

    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdDidCloseDetailInAdView placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
    [self removeNativeAdView:placementID];
    ATFLog(@"原生广告细节关闭，部分广告平台有此回调");
}

#pragma mark - private
- (void)removeNativeAdView:(NSString *)placementID{

    if ([self.nativeViewDic.allKeys containsObject:placementID]) {
        ATNativeADView *adView = self.nativeViewDic[placementID];
        [adView removeFromSuperview];
        [self.nativeViewDic removeObjectForKey:placementID];
        adView = nil;
        [self.container removeFromSuperview];
        self.container = nil;
    }
 
    
}

- (ATNativeADConfiguration *)getATNativeADConfiguration:(NSDictionary *)extraDic isAdaptiveHeight:(BOOL)isAdaptiveHeight {

    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:Parent];
    ATFNativeAttributeMode *mainImageMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:MainImage];
    UIViewController *tempController = [ATFCommonTool getRootViewController];
    ATNativeADConfiguration *config = [[ATNativeADConfiguration alloc] init];
    config.ADFrame = CGRectMake(parentMode.x, parentMode.y, parentMode.width, parentMode.height);
    config.mediaViewFrame = CGRectMake(mainImageMode.x, mainImageMode.y, mainImageMode.width, mainImageMode.height);
    config.delegate = self;
    config.rootViewController = tempController;
    config.sizeToFit = isAdaptiveHeight;
    config.context = @{
        kATNativeAdConfigurationContextAdOptionsViewFrameKey:[NSValue valueWithCGRect:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 43.0f, .0f, 43.0f, 18.0f)],
        kATNativeAdConfigurationContextAdLogoViewFrameKey:[NSValue valueWithCGRect:CGRectMake(.0f, .0f, 54.0f, 18.0f)],
        kATNativeAdConfigurationContextNetworkLogoViewFrameKey:[NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(config.ADFrame) - 54.0f, CGRectGetHeight(config.ADFrame) - 18.0f, 54.0f, 18.0f)]
    };
    
    return  config;
}

- (void)addNativeView:(NSDictionary *)extraDic placementID:(NSString *)placementID{

    UIView *tempView = [ATFCommonTool getRootViewController].view;


    if ([self.nativeViewDic.allKeys containsObject:placementID]) {

        ATNativeADView *adView = self.nativeViewDic[placementID];
        [tempView addSubview:adView];
        
        //[tempView addSubview:adView];

    }else {
        ATFLog(@"retrive ad view failed");
    }
}

#pragma mark - lazy
- (NSMutableDictionary *)nativeViewDic {

    if (_nativeViewDic) return _nativeViewDic;

    NSMutableDictionary *nativeViewDic = [NSMutableDictionary new];

    return _nativeViewDic = nativeViewDic;
}

@end
