//
//  TYImplementCallback.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYImplementCallback.h"
typedef void (^ImplementCallbackBlock) (void);
typedef void (^textFieldBlock) (id data);
@interface TYImplementCallback()
@property (nonatomic, copy) ImplementCallbackBlock ImplementCallbackNameBlock;
@property (nonatomic, copy) textFieldBlock textFieldNameBlock;
@end
@implementation TYImplementCallback
+ (instancetype)createImpLementCallback:(void (^) (void))perform{
    TYImplementCallback *callback = [[TYImplementCallback alloc] init];
    callback->_ImplementCallbackNameBlock = perform;
    return callback;
}

+ (instancetype)outputData:(void (^) (id data))perform{
    TYImplementCallback *callback = [[TYImplementCallback alloc] init];
    callback->_textFieldNameBlock = perform;
    return callback;
}

- (void)callback{
    if (_ImplementCallbackNameBlock) {
        _ImplementCallbackNameBlock();
    }
}

- (void)performOutput:(id)data {
    if (_textFieldNameBlock) {
        _textFieldNameBlock(data);
    }
}

@end
