//
//  ATFInitManger.m
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/26.
//

#import "ATFInitManger.h"
#import "ATFSendSignalManger.h"
#import "ATFCommonTool.h"
#import "ATFConfiguration.h"


//iOS 14
#import <AppTrackingTransparency/AppTrackingTransparency.h>

#define InitCallName  @"InitCallName"

#define DataConsentSetPersonalized  @"ATDataConsentSetPersonalized"
#define DataConsentSetNonpersonalized  @"ATDataConsentSetNonpersonalized"
#define DataConsentSetUnknown  @"ATDataConsentSetUnknown"


@implementation ATFInitManger

/// 日志开关,默认为开
+ (void)setLogEnabled:(BOOL)logEnabled{
    
    
 
    
    [ATAPI setLogEnabled:logEnabled];
}

/// 设置渠道
+ (void)setChannelStr:(NSString *)channelStr{
    
    if (channelStr == nil) {
        return;
    }
    [ATAPI sharedInstance].channel = channelStr;
}

/// 设置子渠道
+ (void)setSubchannelStr:(NSString *)subchannelStr{
    if (subchannelStr == nil) {
        return;
    }
    [ATAPI sharedInstance].subchannel = subchannelStr;
}

/// 设置自定义规则
+ (void)setCustomDataDic:(NSDictionary *)customDataDic{
    
    if (customDataDic == nil || customDataDic.count == 0) {
        return;
    }
    [ATAPI sharedInstance].customData = customDataDic;
}

/// 设置排除交叉推广APP列表
+ (void)setExludeAppleIdArray:(NSArray *)exludeAppleIdArray{
    
    if (exludeAppleIdArray == nil || exludeAppleIdArray.count == 0) {
        return;
    }
    
    [[ATAPI sharedInstance] setExludeAppleIdArray:exludeAppleIdArray];
}

/// 设置placementid规则
+ (void)setPlacementCustomData:(NSDictionary *)customDataDic placementIDStr:(NSString *)placementIDStr{
    
    if (customDataDic == nil && placementIDStr == nil ) {
        return;
    }
    
    [[ATAPI sharedInstance] setCustomData:customDataDic forPlacementID:placementIDStr];
}

///  获取GDPR等级
+ (NSString *)getGDPRLevel{
    
    ATDataConsentSet consentSet = [ATAPI sharedInstance].dataConsentSet;
    NSString *levelStr;
    if (consentSet == ATDataConsentSetNonpersonalized) {
        levelStr = @"ATDataConsentSetNonpersonalized";
    }
    else if (consentSet == ATDataConsentSetPersonalized){
        levelStr = @"ATDataConsentSetPersonalized";
    }
    else{
        levelStr = @"ATDataConsentSetUnknown";
    }
    return  levelStr;
}

///  获取用户位置
+ (void)getUserLocation{
    
    ATDataConsentSet consentSet = [ATAPI sharedInstance].dataConsentSet;

    NSString *consentSetStr = [NSString stringWithFormat:@"%ld",(long)consentSet];
    
    [[ATAPI sharedInstance] getUserLocationWithCallback:^(ATUserLocation location) {
        if (location == ATUserLocationInEU) {
            ATFLog(@"Get user location----------ATUserLocationInEU");
            [self sendInitUserLocation:@"1" consentSet:consentSetStr];
        }else if (location == ATUserLocationOutOfEU){
            [self sendInitUserLocation:@"2" consentSet:consentSetStr];
            ATFLog(@"Get user location----------ATUserLocationOutOfEU");
        }else{
            [self sendInitUserLocation:@"0" consentSet:consentSetStr];
            ATFLog(@"Get user location----------ATUserLocationUnknown");
        }
    }];    
}

/// 初始化SDK
+ (void)initAnyThinkSDKAppID:(NSString *)appIdStr appKeyStr:(NSString *)appKeyStr requestError:(RequestErrorBlock) requestErrorBlock{
    
    [ATAPI integrationChecking];
    
    if (@available(iOS 14, *)) {
        //iOS 14
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            
            [self startSDK:appIdStr appKeyStr:appKeyStr requestError:requestErrorBlock];
        }];
        
    } else {
        
        [self startSDK:appIdStr appKeyStr:appKeyStr requestError:requestErrorBlock];
    }
    
}
///  展示GDPR授权界面
+ (void)showGDPRAuth{
    
    [[ATAPI sharedInstance] presentDataConsentDialogInViewController: [ATFCommonTool getRootViewController] dismissalCallback:^{
        
        [self getUserLocation];
        
    }];
}

///  设置GDPR等级
+ (void)setDataConsentSet:(NSString *)gdprLevel{
    
    if ([gdprLevel isEqualToString:DataConsentSetNonpersonalized]) {
        [[ATAPI sharedInstance] setDataConsentSet:ATDataConsentSetNonpersonalized consentString:nil];
    }
    else if ([gdprLevel isEqualToString:DataConsentSetPersonalized]){
        
        [[ATAPI sharedInstance] setDataConsentSet:ATDataConsentSetPersonalized consentString:nil];
    }
}

///  限制这些隐私数据上报
+ (void)setDeniedUploadInfoArray:(NSArray *)infoArray{
    
    [[ATAPI sharedInstance] setDeniedUploadInfoArray:infoArray];
}

#pragma mark - private
+ (void)sendInitUserLocation:(NSString *)location consentSet:(NSString *)consentSetStr{
    
    [SendEventManger sendMethod: InitCallName arguments:@{@"location":location,@"consentSet":consentSetStr} result:^(id reslut) {}];
}

+ (void)startSDK:(NSString *)appIdStr appKeyStr:(NSString *)appKeyStr
    requestError: (RequestErrorBlock) requestErrorBlock{
    
    NSError *error;
        
    [[ATAPI sharedInstance] startWithAppID:appIdStr appKey:appKeyStr error:&error];
    requestErrorBlock(error);
}





@end
