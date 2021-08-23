//
//  ATFDataMode.m
//  Pods-Runner
//
//  Created by GUO PENG on 2021/6/26.
//

#import "ATFCoconfigurManger.h"
#import "ATFConfiguration.h"

@implementation ATFCoconfigurManger

+(instancetype) sharedManager {
    static ATFCoconfigurManger *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ATFCoconfigurManger alloc] init];
    });
    return sharedManager;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    ATFLog(@"Undefined key——%@",key);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"-----:appIdStr:%@\nappKeyStr:%@\n logEnabled:%d\n customDataDic:%@\n exludeAppleIdArray:%@\n channelStr:%@\n subchannelStr:%@\n placementCustomDataDic:%@\n PlacementIDStr:%@", self.appIdStr,self.appKeyStr,self.isLogEnabled,self.customDataDic,self.exludeBundleIDArray,self.channelStr,self.subchannelStr,self.placementCustomDataDic,self.placementIDStr];
}
@end
