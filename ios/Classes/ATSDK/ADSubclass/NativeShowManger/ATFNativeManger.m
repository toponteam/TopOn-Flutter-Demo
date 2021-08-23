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
#import "ATFNativeAdView.h"
#import "ATFSendSignalManger.h"
#import "ATFDisposeDataTool.h"


#define NativeCallName  @"NativeCall"


//#define NativeAdFailToLoadAD  @"nativeAdFailToLoadAD"
//#define NativeAdDidFinishLoading  @"nativeAdDidFinishLoading"
//#define NativeAddidClick  @"nativeAdDidClick"
//#define NativeAdDidDeepLink  @"nativeAdDidDeepLink"
//#define NativeAddidEndPlayingVideo  @"nativeAdDidEndPlayingVideo"
//#define NativeAdEnterFullScreenVideo  @"nativeAdEnterFullScreenVideo"
//#define NativeAdExitFullScreenVideoInAd  @"nativeAdExitFullScreenVideoInAd"
//#define NativeAddidShowNativeAd  @"nativeAdDidShowNativeAd"
//#define NativeAddidStartPlayingVideo  @"nativeAdDidStartPlayingVideo"
//#define NativeAddidTapCloseButton  @"nativeAdDidTapCloseButton"
//#define NativeAdDidCloseDetailInAdView  @"nativeAdDidCloseDetailInAdView"
//
//#define NativeAddidLoadSuccessDraw  @"nativeAdDidLoadSuccessDraw"

@interface ATFNativeManger()<ATNativeADDelegate>


//@property (nonatomic,strong) NSMutableDictionary *nativeViewDic;



@end


@implementation ATFNativeManger
//
//
///// 加载原生广告
//- (void)loadNativeWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
//
//    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:Parent];
//
//    [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:@{
//        kATExtraInfoNativeAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(parentMode.width, parentMode.height)],
//    } delegate:self];
//
//}
//
///// 原生广告是否准备好
//- (BOOL)nativeAdReady:(NSString *)placementID{
//
//    BOOL isReady = [[ATAdManager sharedManager] nativeAdReadyForPlacementID:placementID];
//    return  isReady;
//}
//
///// 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
//- (NSString *)getNativeValidAds:(NSString *)placementID{
//
//    NSArray *array = [[ATAdManager sharedManager] getNativeValidAdsForPlacementID:placementID];
//      NSString *str = [ATFCommonTool toReadableJSONString:array];
//      return str;
//}
//
//
///// 获取原生广告位的状态
//- (NSString *)checkNativeLoadStatus:(NSString *)placementID{
//
//    ATCheckLoadModel *model = [[ATAdManager sharedManager] checkNativeLoadStatusForPlacementID:placementID];
//    NSString *statusStr = [ATFCommonTool objectToJSONString:model];
//    return  statusStr;
//}
//
///// 展示原生广告
//- (void)showNative:(NSString *)placementID extraDic:(NSDictionary *) extraDic{
//
//    ATNativeADConfiguration *config = [self getATNativeADConfiguration:extraDic];
//
//    ATFNativeAdView *adView = (ATFNativeAdView*)[[ATAdManager sharedManager] retriveAdViewWithPlacementID:placementID configuration:config];
//
//    if (adView != nil) {
//        self.nativeViewDic[placementID] = adView;
//    }
//
//
//    [self addNativeView:extraDic placementID:placementID];
//}
//
///// 展示场景原生广告
//- (void)showNative:(NSString *)placementID sceneID:(NSString *)sceneID extraDic:(NSDictionary *) extraDic{
//
//
//    ATNativeADConfiguration *config = [self getATNativeADConfiguration:extraDic];
//
//    ATFNativeAdView *adView = (ATFNativeAdView*)[[ATAdManager sharedManager] retriveAdViewWithPlacementID:placementID configuration:config scene:sceneID];
//
//    if (adView != nil) {
//        self.nativeViewDic[placementID] = adView;
//    }
//
//    [self addNativeView:extraDic placementID:placementID];
//
//}
//
//
//#pragma mark - ATNativeADDelegate
//// 广告加载失败
//- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:NativeAdFailToLoadAD placementID:placementID extraDic:nil error:error];
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//
//    ATFLog(@"原生广告加载失败%@",error);
//}
//// 广告加载成功
//- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
//
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic: NativeAdDidFinishLoading placementID:placementID extraDic:nil];
//
//    [SendEventManger sendMethod:NativeCallName arguments:dic result:nil];
//    ATFLog(@"原生广告加载成功");
//}
//// 广告点击
//- (void)didClickNativeAdInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidClick placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//
//    ATFLog(@"原生广告点击");
//}
//// 广告点击跳转是否为Deeplink形式，目前只针对TopOn Adx的广告返回
//- (void)didDeepLinkOrJumpInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdDidDeepLink placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//    ATFLog(@"原生广告点击跳转是否为Deeplink形式");
//
//}
//// 广告视频结束播放，部分广告平台有此回调
//- (void)didEndPlayingVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidEndPlayingVideo placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//    ATFLog(@"原生广告视频结束播放，部分广告平台有此回调");
//
//}
//// 广告进入全屏播放
//- (void)didEnterFullScreenVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdEnterFullScreenVideo placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//    ATFLog(@"原生广告进入全屏播放");
//
//}
//// 离开全屏播放
//- (void)didExitFullScreenVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdExitFullScreenVideoInAd placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
//    ATFLog(@"原生广告离开全屏播放");
//
//}
//
//// 广告展示成功
//- (void)didShowNativeAdInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidShowNativeAd placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
//    ATFLog(@"原生广告展示成功");
//
//}
//// 广告视频开始播放，部分广告平台有此回调
//- (void)didStartPlayingVideoInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidStartPlayingVideo placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName arguments:dic result:nil];
//    ATFLog(@"原生广告视频开始播放，部分广告平台有此回调");
//
//}
//// 广告关闭按钮被点击，部分广告平台有此回调
//- (void)didTapCloseButtonInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidTapCloseButton placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//    [self removeNativeAdView:placementID];
//    ATFLog(@"原生广告关闭按钮被点击，部分广告平台有此回调");
//
//}
//
//- (void)didLoadSuccessDrawWith:(NSArray *)views placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAddidLoadSuccessDraw placementID:placementID extraDic:extra];
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//    ATFLog(@"原生广告加载Draw成功");
//}
//
//- (void)didCloseDetailInAdView:(ATNativeADView *)adView placementID:(NSString *)placementID extra:(NSDictionary *)extra {
//
//
//    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:NativeAdDidCloseDetailInAdView placementID:placementID extraDic:extra];
//
//    [SendEventManger sendMethod: NativeCallName  arguments:dic result:nil];
//    [self removeNativeAdView:placementID];
//    ATFLog(@"原生广告细节关闭，部分广告平台有此回调");
//
//}
//
//
//#pragma mark - private
//- (void)removeNativeAdView:(NSString *)placementID{
//
//    if ([self.nativeViewDic.allKeys containsObject:placementID]) {
//        ATFNativeAdView *adView = self.nativeViewDic[placementID];
//        [adView removeFromSuperview];
//        [self.nativeViewDic removeObjectForKey:placementID];
//        adView = nil;
//    }
//}
//
//- (ATNativeADConfiguration *)getATNativeADConfiguration:(NSDictionary *)extraDic{
//
//    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:Parent];
//    ATFNativeAttributeMode *mainImageMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:MainImage];
//
//    UIViewController *tempController = [ATFCommonTool getRootViewController];
//
//    ATNativeADConfiguration *config = [[ATNativeADConfiguration alloc] init];
//     config.ADFrame = CGRectMake(parentMode.x, parentMode.y, parentMode.width, parentMode.height);
//    config.mediaViewFrame = CGRectMake(mainImageMode.x, mainImageMode.y, mainImageMode.width, mainImageMode.height);
//
//     config.delegate = self;
//     config.renderingViewClass = [ATFNativeAdView class];
//     config.rootViewController = tempController;
//    return  config;
//}
//
//- (void)addNativeView:(NSDictionary *)extraDic placementID:(NSString *)placementID{
//
//    UIView *tempView = [ATFCommonTool getRootViewController].view;
//
//    if ([self.nativeViewDic.allKeys containsObject:placementID]) {
//
//        ATFNativeAdView *adView = self.nativeViewDic[placementID];
//        [adView layoutChildControls:extraDic];
//        [tempView addSubview:adView];
//
//    }else {
//        ATFLog(@"retrive ad view failed");
//    }
//
//}
//
//#pragma mark - lazy
//- (NSMutableDictionary *)nativeViewDic {
//
//    if (_nativeViewDic) return _nativeViewDic;
//
//    NSMutableDictionary *nativeViewDic = [NSMutableDictionary new];
//
//    return _nativeViewDic = nativeViewDic;
//}

@end
