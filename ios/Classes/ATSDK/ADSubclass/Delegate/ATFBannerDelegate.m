//
//  ATFBannerDelegate.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFBannerDelegate.h"
#import "ATFDisposeDataTool.h"
#import "ATFSendSignalManger.h"
#import "ATFConfiguration.h"


#define BannerCallName  @"BannerCall"

#define BannerAdFailToLoadAD  @"bannerAdFailToLoadAD"
#define BannerAdDidFinishLoading  @"bannerAdDidFinishLoading"
#define BannerAdAutoRefreshSucceed  @"bannerAdAutoRefreshSucceed"
#define BannerAdDidClick  @"bannerAdDidClick"
#define BannerAdDidClose  @"bannerAdDidClose"
#define BannerAdDidDeepLink  @"bannerAdDidDeepLink"
#define BannerAdDidShowSucceed  @"bannerAdDidShowSucceed"
#define BannerAdTapCloseButton  @"bannerAdTapCloseButton"
#define BannerAdAutoRefreshFail  @"bannerAdAutoRefreshFail"

@interface ATFBannerDelegate()

@end


@implementation ATFBannerDelegate


#pragma mark - ATBannerDelegate
// 横幅广告加载失败
- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:BannerAdFailToLoadAD placementID:placementID extraDic:nil error:error];

    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    
    ATFLog(@"Banner failed to load%@",error);
}
// 横幅广告加载成功
- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:BannerAdDidFinishLoading placementID:placementID extraDic:nil];

    [SendEventManger sendMethod: BannerCallName arguments:dic result:^(id reslut) {}];
    ATFLog(@"Banner ads loaded successfully");
    
}
// 横幅广告自动刷新成功
- (void)bannerView:(ATBannerView *)bannerView didAutoRefreshWithPlacement:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:BannerAdAutoRefreshSucceed placementID:placementID extraDic:extra];

    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    ATFLog(@"Banner ads are automatically refreshed successfully");
    
}
// 横幅广告点击
- (void)bannerView:(ATBannerView *)bannerView didClickWithPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:BannerAdDidClick placementID:placementID extraDic:extra];
    
    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    ATFLog(@"Banner ad click");
}

// 横幅广告点击跳转是否为Deeplink形式，目前只针对TopOn Adx的广告返回
- (void)bannerView:(ATBannerView *)bannerView didDeepLinkOrJumpForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:BannerAdDidDeepLink placementID:placementID extraDic:extra];
    dic[DeepLink] = @(success);

    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    
    ATFLog(@"Whether the banner ad click to jump is in the form of Deeplink");
    
}
// 横幅广告展示成功
- (void)bannerView:(ATBannerView *)bannerView didShowAdWithPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:BannerAdDidShowSucceed placementID:placementID extraDic:extra];
    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    ATFLog(@"Banner ad displayed successfully");
}

// 横幅广告中关闭按钮点击
- (void)bannerView:(ATBannerView *)bannerView didTapCloseButtonWithPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    NSMutableDictionary *dic = [ATFDisposeDataTool revampSucceedCallDic:BannerAdTapCloseButton placementID:placementID extraDic:extra];


    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    ATFLog(@"Close button click in banner ad");
    
}
// 横幅广告自动刷新失败
- (void)bannerView:(ATBannerView *)bannerView failedToAutoRefreshWithPlacementID:(NSString *)placementID error:(NSError *)error {
    
    NSMutableDictionary *dic = [ATFDisposeDataTool revampFailCallDic:BannerAdAutoRefreshFail placementID:placementID extraDic:nil error:error];

    [SendEventManger sendMethod: BannerCallName arguments:dic result:nil];
    ATFLog(@"Banner ad auto refresh failed%@",error);
}


@end
