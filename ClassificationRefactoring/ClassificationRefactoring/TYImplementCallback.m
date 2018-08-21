//
//  TYImplementCallback.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYImplementCallback.h"
typedef void (^ImplementCallbackBlock) (void);
@interface TYImplementCallback()
@property (nonatomic, copy) ImplementCallbackBlock ImplementCallbackNameBlock;
@end
@implementation TYImplementCallback
+ (instancetype)createImpLementCallback:(void (^) (void))perform{
    TYImplementCallback *callback = [[TYImplementCallback alloc] init];
    callback->_ImplementCallbackNameBlock = perform;
    return callback;
}


- (void)callback{
    if (_ImplementCallbackNameBlock) {
        _ImplementCallbackNameBlock();
    }
}


@end
