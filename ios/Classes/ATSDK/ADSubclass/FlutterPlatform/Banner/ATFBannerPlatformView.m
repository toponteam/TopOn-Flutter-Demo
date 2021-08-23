//
//  ATFBannerPlatformView.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFBannerPlatformView.h"
#import <AnyThinkBanner/AnyThinkBanner.h>
#import "ATFBannerManger.h"
#import "ATFBannerTool.h"
#import "ATFBannerDelegate.h"
#import "ATFCommonTool.h"

@interface ATFBannerPlatformView()

@property(nonatomic, assign)  int64_t viewId;;

@property(nonatomic, strong) id args;

@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *messenger;

@property(nonatomic, assign) CGRect frame;

@property(nonatomic, strong) ATFBannerDelegate *bannerDelegate;



@end

@implementation ATFBannerPlatformView

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

    NSString *placementID = extraDic[@"placementID"];
    NSString *sceneID = extraDic[@"sceneID"];
    ATBannerView *bannerView = [[ATAdManager sharedManager] retrieveBannerViewForPlacementID:placementID scene:sceneID];
    bannerView.delegate = self.bannerDelegate;
    bannerView.backgroundColor = [UIColor whiteColor];
    bannerView.presentingViewController = [ATFCommonTool getRootViewController];
    
    if (bannerView != nil) {
        return bannerView;
    }else{
        UILabel *label = [[UILabel alloc]init];
        label.text = @"Ad view failed to load";
        return label;
    }
    
}

#pragma mark - lazy
- (ATFBannerDelegate *)bannerDelegate {

    if (_bannerDelegate) return _bannerDelegate;

    ATFBannerDelegate *bannerDelegate = [ATFBannerDelegate new];

    return _bannerDelegate = bannerDelegate;
}

@end
