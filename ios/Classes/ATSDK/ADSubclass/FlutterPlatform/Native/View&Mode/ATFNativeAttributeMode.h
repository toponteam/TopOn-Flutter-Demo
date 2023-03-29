//
//  ATFNativeAttributeMode.h
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATFNativeAttributeMode : NSObject

@property(nonatomic, assign) double x;

@property(nonatomic, assign) double y;

@property(nonatomic, assign) double width;

@property(nonatomic, assign) double height;

@property(nonatomic, copy) NSString *backgroundColorStr;

@property(nonatomic, copy) NSString *textColorStr;

@property(nonatomic, assign) double textSize;

@property(nonatomic, copy) NSString *textAlignmentStr;

@end

NS_ASSUME_NONNULL_END
