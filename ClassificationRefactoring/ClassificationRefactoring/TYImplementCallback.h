//
//  TYImplementCallback.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYImplementCallback : NSObject
+ (instancetype)createImpLementCallback:(void (^) (void))perform;
+ (instancetype)outputData:(void (^) (id data))perform;
- (void)callback;
- (void)performOutput:(id)data;
/**
 是否允许执行操作
 */
- (void)clickStateAllow:(BOOL)state;
@end
