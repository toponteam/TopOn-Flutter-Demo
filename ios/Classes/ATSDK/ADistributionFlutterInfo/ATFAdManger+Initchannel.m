//
//  ATFAdManger+Initchannel.m
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/26.
//

#import "ATFAdManger+Initchannel.h"
#import "ATFInitManger.h"
#import "ATFCoconfigurManger.h"
#import "ATFConfiguration.h"
#import "ATFDisposeDataTool.h"

@implementation ATFAdManger (Initchannel)

- (void)initFlutterInformation:(FlutterMethodCall*)call result:(FlutterResult)result{
    
    
    // 设置日志开关
    if ([SetLogEnabled isEqualToString:call.method]) {
        [ATFInitManger setLogEnabled:ATFCoconfigurMode.isLogEnabled];
        result(@(ATFCoconfigurMode.isLogEnabled));
    }
    // 设置渠道
    else if ([SetChannelStr isEqualToString:call.method]) {
        [ATFInitManger setChannelStr:ATFCoconfigurMode.channelStr];
        result(ATFCoconfigurMode.channelStr);
    }
    // 设置子渠道
    else if ([SetSubchannelStr isEqualToString:call.method]) {
        [ATFInitManger setSubchannelStr:ATFCoconfigurMode.subchannelStr];
        result(ATFCoconfigurMode.subchannelStr);
    }
    
    // 设置自定义规则
    else if ([SetCustomDataDic isEqualToString:call.method]) {
        [ATFInitManger setCustomDataDic:ATFCoconfigurMode.customDataDic];
        result(ATFCoconfigurMode.customDataDic);
    }
    
    
    // 设置排除交叉推广APP列表
    else if ([SetExludeBundleIDArray isEqualToString:call.method]) {
        [ATFInitManger setExludeAppleIdArray:ATFCoconfigurMode.exludeBundleIDArray];
        result(ATFCoconfigurMode.exludeBundleIDArray);
    }
    
    // 设置placementid规则
    else if ([SetPlacementCustomData isEqualToString:call.method]) {
        [ATFInitManger setPlacementCustomData:ATFCoconfigurMode.placementCustomDataDic placementIDStr:ATFCoconfigurMode.placementIDStr];
        result(ATFCoconfigurMode.placementIDStr);
    }
    
    // 获取GDPR等级
    else if ([GetGDPRLevel isEqualToString:call.method]) {
        NSString *level = [ATFInitManger getGDPRLevel];
        result(level);
        
    }
    
    // 获取用户位置
    else if ([GetUserLocation isEqualToString:call.method]) {
        [ATFInitManger getUserLocation];        
    }

    // 展示GDPR授权界面
    else if ([ShowGDPRAuth isEqualToString:call.method]) {
        [ATFInitManger showGDPRAuth];
    }
    
    // 设置GDPR等级
    else if ([SetDataConsentSet isEqualToString:call.method]) {
        [ATFInitManger setDataConsentSet:ATFCoconfigurMode.gdprLevel];
    }
    
    // 限制隐私数据上报
    else if ([SetDeniedUploadInfoArray isEqualToString:call.method]) {
        
        [ATFInitManger setDeniedUploadInfoArray:ATFCoconfigurMode.deniedUploadInfoArray];
    }
    // 初始化SDK
    else if ([InitAnyThinkSDK isEqualToString:call.method]) {
        [self starToponSDK:call result:result];
    }
}


#pragma mark - private
// 初始化SDK
- (void)starToponSDK:(FlutterMethodCall *)call result:(FlutterResult)result{
    
    [ATFInitManger initAnyThinkSDKAppID:ATFCoconfigurMode.appIdStr appKeyStr:ATFCoconfigurMode.appKeyStr requestError:^(NSError * resultError) {
        
        if (resultError == nil) {
            result(@"succeed");
        }else{
            NSString *codeStr = [NSString stringWithFormat:@"%ld---error:%@",(long)resultError.code,resultError.domain];
            result(codeStr);
        }
    }];
}
@end
