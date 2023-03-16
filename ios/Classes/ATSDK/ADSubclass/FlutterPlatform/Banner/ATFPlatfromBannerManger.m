//
//  ATFPlatfromBannerManger.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFPlatfromBannerManger.h"
#import <AnyThinkBanner/AnyThinkBanner.h>
#import "ATFCommonTool.h"
#import "ATFConfiguration.h"
#import "ATFBannerDelegate.h"
#import "ATFBannerTool.h"
//5.6.6版本以上支持 admob 自适应banner （用到时再import该头文件）
//#import <GoogleMobileAds/GoogleMobileAds.h>

static NSString *kATBannerAdLoadingExtraInlineAdaptiveWidthKey = @"adaptive_width";
static NSString *kATBannerAdLoadingExtraInlineAdaptiveOrientationKey = @"adaptive_orientation";

@interface ATFPlatfromBannerManger()

@property(nonatomic, strong) ATFBannerDelegate *bannerDelegate;

@end

@implementation ATFPlatfromBannerManger

#pragma mark - publice
/// 加载横幅广告
- (void)loadBannerWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
    
    CGRect rect = [ATFBannerTool getSizeFromExtraDic:extraDic];
        
    
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



#pragma mark - lazy
- (ATFBannerDelegate *)bannerDelegate {

    if (_bannerDelegate) return _bannerDelegate;

    ATFBannerDelegate *bannerDelegate = [ATFBannerDelegate new];

    return _bannerDelegate = bannerDelegate;
}
@end
