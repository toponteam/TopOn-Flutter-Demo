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
#import "ATFNativeAdView.h"


@implementation ATFNativeTool

+ (ATNativeADConfiguration *)getATNativeADConfiguration:(NSDictionary *)extraDic{
    
    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:Parent];
    ATFNativeAttributeMode *mainImageMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:MainImage];
    
    UIViewController *tempController = [ATFCommonTool getRootViewController];
    
    ATNativeADConfiguration *config = [[ATNativeADConfiguration alloc] init];
     config.ADFrame = CGRectMake(parentMode.x, parentMode.y, parentMode.width, parentMode.height);
    config.mediaViewFrame = CGRectMake(mainImageMode.x, mainImageMode.y, mainImageMode.width, mainImageMode.height);    
     config.renderingViewClass = [ATFNativeAdView class];
     config.rootViewController = tempController;
    return  config;
}
@end
