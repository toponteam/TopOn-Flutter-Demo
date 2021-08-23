//
//  ATFBannerPlatformViewFactory.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFBannerPlatformViewFactory.h"
#import "ATFBannerPlatformView.h"

@interface ATFBannerPlatformViewFactory()


@property(nonatomic, strong) NSObject<FlutterBinaryMessenger>*messenger;

@end

@implementation ATFBannerPlatformViewFactory

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        self.messenger = messager;
    }
    return self;
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    
    ATFBannerPlatformView *bannerView = [[ATFBannerPlatformView alloc]initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:self.messenger];

    return  bannerView;    
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

@end
