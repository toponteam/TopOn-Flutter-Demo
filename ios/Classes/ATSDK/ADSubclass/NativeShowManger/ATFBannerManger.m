//
//  ATFBannerManger.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFBannerManger.h"
#import <AnyThinkBanner/AnyThinkBanner.h>
#import "ATFCommonTool.h"
#import "ATFConfiguration.h"
#import "ATFBannerDelegate.h"
#import "ATFBannerTool.h"

// 针对Admob平台，支持Admob banner广告自适应
//#import <GoogleMobileAds/GoogleMobileAds.h>

//#define ATFBannerAdLoadingExtraBannerAdSizeStruct  @"kATBannerAdLoadingExtraBannerAdSizeStruct"

@interface ATFBannerManger()

@property (nonatomic,strong) NSMutableDictionary *rectDic;

@property (nonatomic,strong) NSMutableDictionary *bannerViewDic;


@property(nonatomic, strong) ATFBannerDelegate *bannerDelegate;



@end

@implementation ATFBannerManger

#pragma mark - publice
/// 加载横幅广告
- (void)loadBannerWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
    
    CGRect rect = [ATFBannerTool getSizeFromExtraDic:extraDic];
    
    self.rectDic[placementID] = NSStringFromCGRect(rect);
    
    
    [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:@{kATAdLoadingExtraBannerAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(rect.size.width,  rect.size.height)]} delegate:self.bannerDelegate];
    

    //    if (extraDic[kATBannerAdLoadingExtraInlineAdaptiveWidthKey] != nil && extraDic[kATBannerAdLoadingExtraInlineAdaptiveOrientationKey] != nil) {
            // admob 自适应banner，5.6.6版本以上支持 针对Admob平台，支持Admob banner广告自适应
            //GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth 自适应
            //GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth 竖屏
            //GADLandscapeAnchoredAdaptiveBannerAdSizeWithWidth 横屏
    //        CGFloat admobBannerWidth = [extraDic[kATBannerAdLoadingExtraInlineAdaptiveWidthKey] doubleValue];
    //        GADAdSize admobSize;
    //        if ([extraDic[kATBannerAdLoadingExtraInlineAdaptiveOrientationKey] integerValue] == 1) {
    //            admobSize = GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(admobBannerWidth);
    //        } else if ([extraDic[kATBannerAdLoadingExtraInlineAdaptiveOrientationKey] integerValue] == 2) {
    //
    //            admobSize = GADLandscapeAnchoredAdaptiveBannerAdSizeWithWidth(admobBannerWidth);
    //        } else {
    //            admobSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(admobBannerWidth);
    //        }
            
    //        [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:@{
    //
    //            kATAdLoadingExtraBannerAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(rect.size.width,  rect.size.height)],
    //
    //            kATAdLoadingExtraBannerSizeAdjustKey:@NO,
    //
    //            kATAdLoadingExtraAdmobBannerSizeKey:[NSValue valueWithCGSize:admobSize.size],
    //            kATAdLoadingExtraAdmobAdSizeFlagsKey:@(admobSize.flags)
    //
    //        } delegate:self];
    //    }
    
}



/// 用位置和宽高属性来展示横幅广告
- (void)showBannerInRectangle:(NSString *)placementID extraDic:(NSDictionary *) extraDic{
    
    
    CGRect rect = [ATFBannerTool getSizeFromExtraDic:extraDic];
    
    ATBannerView *bannerView = [ATFBannerTool getBannerViewAdRect:rect placementID:placementID sceneID:nil];
    
    [self setBannerViewVlaue:bannerView placementID:placementID];
    
    [self showBanner:bannerView];
    
}

/// 用位置和宽高属性来展示横幅场景广告
- (void)showBannerInRectangle:(NSString *)placementID sceneID:(NSString *)sceneID extraDic:(NSDictionary *) extraDic{
    
    CGRect rect = [ATFBannerTool getSizeFromExtraDic:extraDic];
    
    ATBannerView *bannerView = [ATFBannerTool getBannerViewAdRect:rect placementID:placementID sceneID:sceneID];
    
    [self setBannerViewVlaue:bannerView placementID:placementID];

    [self showBanner:bannerView];
}

/// 用预定义的位置来展示横幅广告
- (void)showAdInPosition:(NSString *)placementID position:(NSString *) positionStr{
    
    CGRect loadRect =  CGRectFromString(self.rectDic[placementID]);
    
    
    CGRect rect = [self getInPositionFromloadRect:loadRect positionStr:positionStr];
    
    ATFLog(@"自定义横幅位置:%@",NSStringFromCGRect(rect));
        
    ATBannerView *bannerView = [ATFBannerTool getBannerViewAdRect:rect placementID:placementID sceneID:nil];
    [self setBannerViewVlaue:bannerView placementID:placementID];
    [self showBanner:bannerView];}



/// 用预定义的位置来展示横幅场景广告
- (void)showAdInPosition:(NSString *)placementID sceneID:(NSString *)sceneID position:(NSString *) positionStr{
    
    CGRect loadRect =  CGRectFromString(self.rectDic[placementID]);
    CGRect rect = [self getInPositionFromloadRect:loadRect positionStr:positionStr];
    ATFLog(@"自定义场景横幅位置:%@",NSStringFromCGRect(rect));
    ATBannerView *bannerView = [ATFBannerTool getBannerViewAdRect:rect placementID:placementID sceneID:sceneID];
    [self setBannerViewVlaue:bannerView placementID:placementID];

    [self showBanner:bannerView];}


/// 移除横幅广告
- (void)removeBannerAd:(NSString * _Nullable)placementID{
    
    if ([self.bannerViewDic.allKeys containsObject:placementID]) {
        
        UIView *tempView = self.bannerViewDic[placementID];
        [tempView removeFromSuperview];
        tempView = nil;
        [self.bannerViewDic removeObjectForKey:placementID];
    }
}

/// 隐藏横幅广告
- (void)hideBannerAd:(NSString *)placementID{
    
    if ([self.bannerViewDic.allKeys containsObject:placementID]) {
        UIView *tempView = self.bannerViewDic[placementID];
        tempView.hidden = YES;
    }
}

/// 重新展示横幅广告
- (void)afreshShowBannerAd:(NSString *)placementID{
    
    if ([self.bannerViewDic.allKeys containsObject:placementID]) {
        UIView *tempView = self.bannerViewDic[placementID];
        tempView.hidden = NO;
    }
}



#pragma mark - private

- (void)showBanner:(ATBannerView *)bannerView{
    
    UIView *containerView = [ATFCommonTool getRootViewController].view;

    [containerView addSubview:bannerView];

}

- (void)setBannerViewVlaue:(ATBannerView *)bannerView placementID:(NSString *)placementID{
    
    bannerView.delegate = self.bannerDelegate;
    bannerView.backgroundColor = [UIColor whiteColor];
    bannerView.presentingViewController = [ATFCommonTool getRootViewController];
    
    if (bannerView != nil) {
        self.bannerViewDic[placementID] = bannerView;
    }else {
        ATFLog(@"retrieveBannerView  failed");
    }
}


- (CGRect)getInPositionFromloadRect:(CGRect)loadRect positionStr:(NSString *)positionStr{
    
    CGRect rect = CGRectMake(0, NavBarHeight, loadRect.size.width,loadRect.size.height);
        
    if ([positionStr isEqualToString:@"kATBannerAdShowingPositionTop"]) {
        rect.origin.x = 0;
        rect.origin.y = NavBarHeight + 20;
    }
    
    else if ([positionStr isEqualToString:@"kATBannerAdShowingPositionBottom"]) {
        
        rect.origin.x = 0;
        rect.origin.y = SCREEN_HEIGHT - loadRect.size.height - TabbarSafeBottomMargin;
    }
    return  rect;
}


#pragma mark - lazy
- (NSMutableDictionary *)rectDic {

    if (_rectDic) return _rectDic;

    NSMutableDictionary *rectDic = [NSMutableDictionary new];

    return _rectDic = rectDic;
}

- (NSMutableDictionary *)bannerViewDic {

    if (_bannerViewDic) return _bannerViewDic;

    NSMutableDictionary *bannerViewDic = [NSMutableDictionary new];

    return _bannerViewDic = bannerViewDic;
}

- (ATFBannerDelegate *)bannerDelegate {

    if (_bannerDelegate) return _bannerDelegate;

    ATFBannerDelegate *bannerDelegate = [ATFBannerDelegate new];

    return _bannerDelegate = bannerDelegate;
}



@end
