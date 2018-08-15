//
//  TYLnternalLmplementation.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/15.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^stateBlock) (BOOL state);
@interface TYLnternalLmplementation : NSObject
@property (nonatomic, copy) stateBlock stateNameBlock;
+ (instancetype)addLnternalLmplementation:(BOOL (^) (id data))dataBlock;
- (void)perform:(id)data;
@end
