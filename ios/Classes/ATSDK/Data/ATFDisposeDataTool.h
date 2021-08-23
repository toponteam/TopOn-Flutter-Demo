//
//  ATFDisposeDataTool.h
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import "ATFNativeAttributeMode.h"


NS_ASSUME_NONNULL_BEGIN

@interface ATFDisposeDataTool : NSObject

/// 处理初始化SDK,flutter传过来的参数
+ (void)disposeInitData:(NSDictionary *)dic;


/// 处理展示原始广告,flutter传过来的参数
+ (ATFNativeAttributeMode *)disposeNativeData:(NSDictionary *)dic keyStr:(NSString *)keyStr;

/// 处理回调给flutter参数
+ (NSMutableDictionary *)revampSucceedCallDic:(NSString *)callNameKey placementID:(NSString *)placementID extraDic:(NSDictionary *_Nullable)extraDic;

/// 处理回调给flutter参数
+ (NSMutableDictionary *)revampFailCallDic:(NSString *)callNameKey placementID:(NSString *)placementID extraDic:(NSDictionary *_Nullable)extraDic error:(NSError *_Nullable)error;

@end

NS_ASSUME_NONNULL_END
