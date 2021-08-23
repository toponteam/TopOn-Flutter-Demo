//
//  ATFDisposeDataTool.m
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/25.
//

#import "ATFDisposeDataTool.h"
#import "ATFCoconfigurManger.h"
#import "ATFConfiguration.h"
#import <AnyThinkSDK/AnyThinkSDK.h>

@implementation ATFDisposeDataTool


+ (void)disposeInitData:(NSDictionary *)dic{
    [[ATFCoconfigurManger sharedManager] setValuesForKeysWithDictionary:dic];
    
    ATFLog(@"%@",[ATFCoconfigurManger sharedManager].description);
    
}

+ (ATFNativeAttributeMode *)disposeNativeData:(NSDictionary *)dic keyStr:(NSString *)keyStr{
    
    ATFNativeAttributeMode *nativeAttributeMode = [[ATFNativeAttributeMode alloc]init];

    if ([dic.allKeys containsObject:keyStr] == NO) {
        return  nativeAttributeMode;
    }
    
    NSDictionary *tempDic = dic[keyStr];
    [nativeAttributeMode setValuesForKeysWithDictionary:tempDic];
    return nativeAttributeMode;
}

+ (NSMutableDictionary *)revampSucceedCallDic:(NSString *)callNameKey placementID:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    tempDic[CallNameKey] = callNameKey;
    
    tempDic[PlacementID] = placementID;

    tempDic[RequestMessage] = @"succeed";
    if (extraDic != nil && extraDic.count != 0) {
        tempDic[ExtraDic] = extraDic;
    }
    return  tempDic;
}

+ (NSMutableDictionary *)revampFailCallDic:(NSString *)callNameKey placementID:(NSString *)placementID extraDic:(NSDictionary *)extraDic error:(NSError *)error{
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    
    tempDic[CallNameKey] = callNameKey;
    tempDic[PlacementID] = placementID;
    tempDic[RequestMessage] = error.description;
    if (extraDic != nil && extraDic.count != 0) {
        tempDic[ExtraDic] = extraDic;
    }
    return tempDic;
}

@end
