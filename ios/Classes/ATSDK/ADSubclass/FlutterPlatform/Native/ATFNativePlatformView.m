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
#import "ATFNativeAdView.h"

@interface ATFNativePlatformView()

@property(nonatomic, assign)  int64_t viewId;;

@property(nonatomic, strong) id args;

@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *messenger;

@property(nonatomic, assign) CGRect frame;

@property(nonatomic, strong) ATFNativeDelegate *nativeDelegate;




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
    NSString *sceneID = extraDic[@"sceneID"];
    NSDictionary *dic = extraDic[@"extraMap"];
    
    ATNativeADConfiguration *config = [ATFNativeTool getATNativeADConfiguration:dic];
    config.delegate = self.nativeDelegate;
    config.sizeToFit = isAdaptiveHeight;
    ATFNativeAdView *adView = (ATFNativeAdView*)[[ATAdManager sharedManager] retriveAdViewWithPlacementID:placementID configuration:config scene:sceneID];

    [adView renderingChildControls:dic];
    
    [adView layoutChildControls];
    
    if (adView != nil) {
        return adView;
    }else{
        UILabel *label = [[UILabel alloc]init];
        label.text = @"Ad view failed to load";
        return label;
    }
}

#pragma mark - lazy
- (ATFNativeDelegate *)nativeDelegate {

    if (_nativeDelegate) return _nativeDelegate;

    ATFNativeDelegate *nativeDelegate = [ATFNativeDelegate new];

    return _nativeDelegate = nativeDelegate;
}
@end
