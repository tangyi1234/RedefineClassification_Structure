//
//  TYImplementCallback.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//  按钮的回调

#import <Foundation/Foundation.h>

@interface TYImplementCallback : NSObject
+ (instancetype)createImpLementCallback:(void (^) (void))perform;
- (void)callback;

@end
