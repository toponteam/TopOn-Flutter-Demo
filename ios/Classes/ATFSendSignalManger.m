//
//  ATFSendSignalManger.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/28.
//

#import "ATFSendSignalManger.h"

@implementation ATFSendSignalManger
+(instancetype) sharedManager {
    static ATFSendSignalManger *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ATFSendSignalManger alloc] init];
    });
    return sharedManager;
}



- (void)sendMethod:(NSString *) methodName arguments:(id) arguments result: (ResultBlock) resultBlock{
    
    [self.methodChannel invokeMethod:methodName arguments:arguments result:resultBlock];
    
}
@end
