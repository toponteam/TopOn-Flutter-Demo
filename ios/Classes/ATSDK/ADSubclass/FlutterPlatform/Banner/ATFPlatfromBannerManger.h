//
//  ATFPlatfromBannerManger.h
//  anythink_sdk
//
//  Created by GUO PENG on 2021/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFPlatfromBannerManger : NSObject

#pragma mark - flutter api
/// 加载横幅广告
- (void)loadBannerWith:(NSString *)placementID extraDic:(NSDictionary *)extraDic;



@end

NS_ASSUME_NONNULL_END
