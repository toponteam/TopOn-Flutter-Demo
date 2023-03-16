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


#pragma mark - lazy
- (ATFNativeDelegate *)nativeDelegate {

    if (_nativeDelegate) return _nativeDelegate;

    ATFNativeDelegate *nativeDelegate = [ATFNativeDelegate new];

    return _nativeDelegate = nativeDelegate;
}

@end
