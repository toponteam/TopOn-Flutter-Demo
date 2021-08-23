//
//  ATFSendSignalManger.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/28.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

#define SendEventManger [ATFSendSignalManger sharedManager]

typedef void(^ResultBlock)(id _Nonnull );
NS_ASSUME_NONNULL_BEGIN

@interface ATFSendSignalManger : NSObject
+(instancetype) sharedManager;

@property(nonatomic, strong) FlutterMethodChannel *methodChannel;


- (void)sendMethod:(NSString *) methodName arguments:(id) arguments result: (ResultBlock _Nullable) resultBlock;
@end

NS_ASSUME_NONNULL_END
