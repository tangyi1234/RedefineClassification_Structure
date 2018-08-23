//
//  TYLnternalLmplementation.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/15.
//  Copyright © 2018年 yitang. All rights reserved.
//  UITextField输录和点击

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TYLnternalLmplementation : NSObject
+ (instancetype)addDelivery:(void (^) (id data))data;
- (void)delivery:(id)data;
@end
