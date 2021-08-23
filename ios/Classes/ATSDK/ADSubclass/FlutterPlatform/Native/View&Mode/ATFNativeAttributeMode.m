//
//  ATFNativeAttributeMode.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/30.
//

#import "ATFNativeAttributeMode.h"
#import "ATFConfiguration.h"

@implementation ATFNativeAttributeMode

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    ATFLog(@"Undefined key——%@",key);
}
@end
