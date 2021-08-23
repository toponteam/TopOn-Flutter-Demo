//
//  ATFBannerPlatformView.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFBannerPlatformView : NSObject<FlutterPlatformView>


- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger;


- (UIView*)view;

@end

NS_ASSUME_NONNULL_END
