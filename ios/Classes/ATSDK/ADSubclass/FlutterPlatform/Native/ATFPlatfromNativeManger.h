//
//  ATFPlatfromNativeManger.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFPlatfromNativeManger : NSObject
/// 加载原生广告
- (void)loadNativeWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic;




@end

NS_ASSUME_NONNULL_END
