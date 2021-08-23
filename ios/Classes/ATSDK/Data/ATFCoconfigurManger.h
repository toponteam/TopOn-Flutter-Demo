//
//  ATFDataMode.h
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define ATFCoconfigurMode [ATFCoconfigurManger sharedManager]
@interface ATFCoconfigurManger : NSObject
// appidStr
@property(nonatomic, strong) NSString *appIdStr;


/// appKeyStr
@property(nonatomic, strong) NSString *appKeyStr;

/// 日志开关
@property(nonatomic, assign,getter=isLogEnabled) BOOL logEnabled;

/// App的自定义规则
@property(nonatomic, strong) NSDictionary *customDataDic;

/// 交叉推广排除已安装AppID的列表
@property (nonatomic, strong) NSArray *exludeBundleIDArray;

/// 渠道信息
@property(nonatomic, copy) NSString *channelStr;

/// 子渠道信息
@property(nonatomic, copy) NSString *subchannelStr;

/// Placement的自定义规则
@property(nonatomic, strong) NSDictionary *placementCustomDataDic;

/// Placement的自定义规则ID
@property(nonatomic, strong) NSString *placementIDStr;

/// 设置GDPR的等级
@property(nonatomic, strong) NSString *gdprLevel;

/// 限制隐私数据上报
@property (nonatomic, strong) NSArray * deniedUploadInfoArray;

+(instancetype) sharedManager;


@end

NS_ASSUME_NONNULL_END
