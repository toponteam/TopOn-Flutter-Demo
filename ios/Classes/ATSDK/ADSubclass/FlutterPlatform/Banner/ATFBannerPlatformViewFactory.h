//
//  ATFBannerPlatformViewFactory.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFBannerPlatformViewFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

-(NSObject<FlutterMessageCodec> *)createArgsCodec;

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args;

@end

NS_ASSUME_NONNULL_END
