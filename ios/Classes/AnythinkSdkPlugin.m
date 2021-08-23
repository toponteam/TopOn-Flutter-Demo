#import "AnythinkSdkPlugin.h"
#import "ATFAdManger.h"
#import "ATFSendSignalManger.h"
#import "ATFBannerPlatformViewFactory.h"
#import "ATFNativePlatformViewFactory.h"
#import "ATFConfiguration.h"

@interface AnythinkSdkPlugin()
@property(nonatomic, strong) ATFAdManger *distributionManger;


@end

@implementation AnythinkSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"anythink_sdk"
            binaryMessenger:[registrar messenger]];
    
    // 消息发送者
    ATFSendSignalManger *sendManger = [ATFSendSignalManger sharedManager];
    sendManger.methodChannel = channel;
    
    // 注册PlatformView
    [registrar registerViewFactory:[[ATFBannerPlatformViewFactory alloc] initWithMessenger:registrar.messenger] withId:BannerPlatformView];
    
    [registrar registerViewFactory:[[ATFNativePlatformViewFactory alloc] initWithMessenger:registrar.messenger] withId:NativePlatformView];

    
  AnythinkSdkPlugin* instance = [[AnythinkSdkPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    // 消息分类
    [self.distributionManger distributionFlutterInformation:call result:result];

}

#pragma mark - lazy
- (ATFAdManger *)distributionManger {

    if (_distributionManger) return _distributionManger;

    ATFAdManger *distributionManger = [ATFAdManger new];

    return _distributionManger = distributionManger;
}
@end
