//
//  ATFNativePlatformViewFactory.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFNativePlatformViewFactory.h"
#import "ATFNativePlatformView.h"

@interface ATFNativePlatformViewFactory()


@property(nonatomic, strong) NSObject<FlutterBinaryMessenger>*messenger;

@end

@implementation ATFNativePlatformViewFactory

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        self.messenger = messager;
    }
    return self;
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    
    ATFNativePlatformView *nativePlatformView = [[ATFNativePlatformView alloc]initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:self.messenger];
    return  nativePlatformView;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}


@end
