//
//  ATFPlatfromNativeManger.m
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import "ATFPlatfromNativeManger.h"
#import "ATFNativeDelegate.h"
#import "ATFDisposeDataTool.h"
#import "ATFCommonTool.h"
#import "ATFConfiguration.h"


@interface ATFPlatfromNativeManger()

@property(nonatomic, strong) ATFNativeDelegate *nativeDelegate;


@end


@implementation ATFPlatfromNativeManger


/// 加载原生广告
- (void)loadNativeWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic{
            
    ATFNativeAttributeMode *parentMode = [ATFDisposeDataTool disposeNativeData:extraDic keyStr:NativeSize];

    [[ATAdManager sharedManager] loadADWithPlacementID:placementID extra:@{
        kATExtraNativeImageSizeKey:[NSValue valueWithCGSize:CGSizeMake(parentMode.width, parentMode.height)],
    } delegate:self.nativeDelegate];
    
}

/// 原生广告是否准备好
- (BOOL)nativeAdReady:(NSString *)placementID{
    
    BOOL isReady = [[ATAdManager sharedManager] nativeAdReadyForPlacementID:placementID];
    return  isReady;
}

/// 获取当前广告位下所有可用广告的信息，v5.7.53及以上版本支持
- (NSString *)getNativeValidAds:(NSString *)placementID{
    
    NSArray *array = [[ATAdManager sharedManager] getNativeValidAdsForPlacementID:placementID];
      NSString *str = [ATFCommonTool toReadableJSONString:array];
      return str;
}


/// 获取原生广告位的状态
- (NSDictionary *)checkNativeLoadStatus:(NSString *)placementID{
    
    ATCheckLoadModel *model = [[ATAdManager sharedManager] checkNativeLoadStatusForPlacementID:placementID];
    NSDictionary *dic = [ATFCommonTool objectToJSONString:model];
    return  dic;
}

#pragma mark - lazy
- (ATFNativeDelegate *)nativeDelegate {

    if (_nativeDelegate) return _nativeDelegate;

    ATFNativeDelegate *nativeDelegate = [ATFNativeDelegate new];

    return _nativeDelegate = nativeDelegate;
}

@end
