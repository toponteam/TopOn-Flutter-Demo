//
//  ATFNativeTool.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>
#import <AnyThinkNative/AnyThinkNative.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFNativeTool : NSObject

+ (ATNativeADConfiguration *)getATNativeADConfiguration:(NSDictionary *)extraDic;

@end

NS_ASSUME_NONNULL_END
