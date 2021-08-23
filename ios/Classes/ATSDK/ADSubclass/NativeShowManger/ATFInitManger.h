//
//  ATFInitManger.h
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/26.
//

#import <Foundation/Foundation.h>
#import <AnyThinkSDK/AnyThinkSDK.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^RequestErrorBlock)(NSError*);

@interface ATFInitManger : NSObject


/// 日志开关,默认为开
+ (void)setLogEnabled:(BOOL)logEnabled;

/// 设置渠道
+ (void)setChannelStr:(NSString *)channelStr;

/// 设置子渠道
+ (void)setSubchannelStr:(NSString *)subchannelStr;

/// 设置自定义规则
+ (void)setCustomDataDic:(NSDictionary *)customDataDic;

/// 设置排除交叉推广APP列表
+ (void)setExludeAppleIdArray:(NSArray *)exludeAppleIdArray;

/// 设置placementid规则
+ (void)setPlacementCustomData:(NSDictionary *)customDataDic placementIDStr:(NSString *)placementIDStr;

///  获取GDPR等级
+ (NSString *)getGDPRLevel;

///  获取用户位置
+ (void)getUserLocation;

///  展示GDPR授权界面
+ (void)showGDPRAuth;

///  设置GDPR等级
+ (void)setDataConsentSet:(NSString *)gdprLevel;

///  限制这些隐私数据上报
+ (void)setDeniedUploadInfoArray:(NSArray *)infoArray;

/// 初始化SDK
+ (void)initAnyThinkSDKAppID:(NSString *)appIdStr appKeyStr:(NSString *)appKeyStr requestError:(RequestErrorBlock) requestErrorBlock;





@end

NS_ASSUME_NONNULL_END
