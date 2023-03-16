//
//  ATFNativeTool.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFNativeTool.h"
#import "ATFDisposeDataTool.h"
#import "ATFConfiguration.h"
#import "ATFCommonTool.h"


@implementation ATFNativeTool

+ (ATNativeADConfiguration *)getATNativeADConfiguration:(NSDictionary *)extraDic{
    
    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:Parent];
    ATFNativeAttributeMode *mainImageMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:MainImage];
    
    UIViewController *tempController = [ATFCommonTool getRootViewController];
    
    ATNativeADConfiguration *config = [[ATNativeADConfiguration alloc] init];
     config.ADFrame = CGRectMake(parentMode.x, parentMode.y, parentMode.width, parentMode.height);
    config.mediaViewFrame = CGRectMake(mainImageMode.x, mainImageMode.y, mainImageMode.width, mainImageMode.height);
    config.rootViewController = tempController;
    return  config;
}


/// 原生广告是否准备好
+ (BOOL)nativeAdReady:(NSString *)placementID{

    BOOL isReady = [[ATAdManager sharedManager] nativeAdReadyForPlacementID:placementID];
    return  isReady;
}

/// 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
+ (NSString *)getNativeValidAds:(NSString *)placementID{

    NSArray *array = [[ATAdManager sharedManager] getNativeValidAdsForPlacementID:placementID];
      NSString *str = [ATFCommonTool toReadableJSONString:array];
      return str;
}


/// 获取原生广告位的状态
+ (NSDictionary *)checkNativeLoadStatus:(NSString *)placementID{
    
    ATCheckLoadModel *model = [[ATAdManager sharedManager] checkNativeLoadStatusForPlacementID:placementID];
    NSDictionary *dic = [ATFCommonTool objectToJSONString:model];
    return  dic;
}

@end
