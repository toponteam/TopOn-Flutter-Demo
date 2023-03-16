//
//  ATFNativePlatformView.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFNativePlatformView.h"
#import "ATFNativeTool.h"
#import "ATFCommonTool.h"
#import "ATFNativeDelegate.h"
#import "ATFNativeTool.h"
#import "ATFNativeSelfRenderView.h"
#import <Masonry/Masonry.h>

#define ATFkScreenW ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown ? UIScreen.mainScreen.bounds.size.width : UIScreen.mainScreen.bounds.size.height)

#define ATFkNavigationBarHeight ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown ? ([[UIApplication sharedApplication]statusBarFrame].size.height + 44) : ([[UIApplication sharedApplication]statusBarFrame].size.height - 4))

#define ATFkScreenH ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown ? UIScreen.mainScreen.bounds.size.height : UIScreen.mainScreen.bounds.size.width)

@interface ATFNativePlatformView()

@property(nonatomic, assign)  int64_t viewId;;

@property(nonatomic, strong) id args;

@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *messenger;

@property(nonatomic, assign) CGRect frame;

@property(nonatomic, strong) ATFNativeDelegate *nativeDelegate;

@property(nonatomic, strong) ATFNativeSelfRenderView *nativeSelfRenderView;




@end

@implementation ATFNativePlatformView


- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    
    if (self = [super init]){
        
        self.frame = frame;
        self.viewId = viewId;
        self.args = args;
        self.messenger = messenger;
    }
    return  self;
}
#pragma mark - FlutterPlatformView
- (UIView*)view{
    
    NSDictionary *extraDic;
    if ([self.args isKindOfClass:[NSDictionary class]]) {
        extraDic = (NSDictionary *)self.args;
    }
    
    BOOL isAdaptiveHeight = [extraDic[@"isAdaptiveHeight"] boolValue];
    NSString *placementID = extraDic[@"placementID"];
    NSDictionary *dic = extraDic[@"extraMap"];
    
    ATNativeAdOffer *offer = [[ATAdManager sharedManager] getNativeAdOfferWithPlacementID:placementID];
    ATFNativeSelfRenderView *selfRenderView = [self getSelfRenderViewOffer:offer];
    
    ATNativeADConfiguration *config = [ATFNativeTool getATNativeADConfiguration:dic];
    config.delegate = self.nativeDelegate;
    config.sizeToFit = isAdaptiveHeight;
    
    ATNativeADView *adView = [self getNativeADView:config offer:offer selfRenderView:selfRenderView withPlacementId:placementID];
    
    [selfRenderView setUIWidget:dic];

    [self prepareWithNativePrepareInfo:selfRenderView nativeADView:adView];
    [offer rendererWithConfiguration:config selfRenderView:selfRenderView nativeADView:adView];
    
    if (adView != nil) {
        return adView;
    }else{
        UILabel *label = [[UILabel alloc]init];
        label.text = @"Ad view failed to load";
        return label;
    }
}

- (ATFNativeSelfRenderView *)getSelfRenderViewOffer:(ATNativeAdOffer *)offer{
    ATFNativeSelfRenderView *selfRenderView = [[ATFNativeSelfRenderView alloc]initWithOffer:offer];
    self.nativeSelfRenderView = selfRenderView;
    return selfRenderView;
}

- (ATNativeADView *)getNativeADView:(ATNativeADConfiguration *)config offer:(ATNativeAdOffer *)offer selfRenderView:(ATFNativeSelfRenderView *)selfRenderView withPlacementId:(NSString*)placementID{
    
    ATNativeADView *nativeADView = [[ATNativeADView alloc]initWithConfiguration:config currentOffer:offer placementID:placementID];

    UIView *mediaView = [nativeADView getMediaView];

    NSMutableArray *array = [@[selfRenderView.iconImageView,selfRenderView.titleLabel,selfRenderView.textLabel,selfRenderView.ctaLabel,selfRenderView.mainImageView] mutableCopy];

    if (mediaView) {
        [array addObject:mediaView];
        selfRenderView.mediaView = mediaView;
        [selfRenderView addSubview:mediaView];
//        [selfRenderView layoutIfNeeded];
//        [mediaView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.equalTo(selfRenderView);
//            make.top.equalTo(selfRenderView.mainImageView.mas_top);
//        }];
    }
    [nativeADView registerClickableViewArray:array];
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

#pragma mark - lazy
- (ATFNativeDelegate *)nativeDelegate {

    if (_nativeDelegate) return _nativeDelegate;

    ATFNativeDelegate *nativeDelegate = [ATFNativeDelegate new];

    return _nativeDelegate = nativeDelegate;
}
@end
