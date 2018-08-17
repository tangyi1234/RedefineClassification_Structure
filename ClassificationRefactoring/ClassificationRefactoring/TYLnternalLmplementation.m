//
//  TYLnternalLmplementation.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/15.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYLnternalLmplementation.h"
typedef BOOL (^performBlock) (id data);

@interface TYLnternalLmplementation()
@property (nonatomic, copy) performBlock performNameBlock;

@end
@implementation TYLnternalLmplementation
+ (instancetype)addLnternalLmplementation:(BOOL (^) (id data))dataBlock {
    TYLnternalLmplementation *lnternal = [[TYLnternalLmplementation alloc] init];
    lnternal->_performNameBlock = dataBlock;
    return lnternal;
}

- (void)perform:(id)data {
    BOOL state;
    if (_performNameBlock) {
       state = _performNameBlock(data);
        if (_stateNameBlock) {
            _stateNameBlock(state);
        }
    }
}

@end
