//
//  UIControl+TYIControl.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "UIControl+TYIControl.h"
#import "TYImplementCallback.h"
#import "TYLnternalLmplementation.h"
#import <objc/runtime.h>
typedef void (^controlBlock) (void);
@interface UIControl()
@property (nonatomic, copy) controlBlock controlNameBlock;
@property (nonatomic, strong) TYImplementCallback *back;
@property (nonatomic, strong) TYLnternalLmplementation *lnternal;
@end
@implementation UIControl (TYIControl)
static void *controlNameBlockKey = &controlNameBlockKey;
static void *backKey = &backKey;
static void *lnternalKey = &lnternalKey;
- (controlBlock)controlNameBlock{
    return objc_getAssociatedObject(self, &controlNameBlockKey);
}

- (void)setControlNameBlock:(controlBlock)controlNameBlock {
    objc_setAssociatedObject(self, &controlNameBlockKey, controlNameBlock, OBJC_ASSOCIATION_COPY);
}

- (TYImplementCallback *)back{
    return objc_getAssociatedObject(self, &backKey);
}

- (void)setBack:(TYImplementCallback *)back {
    objc_setAssociatedObject(self, &backKey, back, OBJC_ASSOCIATION_RETAIN);
}

- (TYLnternalLmplementation *)lnternal {
    return objc_getAssociatedObject(self, &lnternalKey);
}

- (void)setLnternal:(TYLnternalLmplementation *)lnternal {
    objc_setAssociatedObject(self, &lnternalKey, lnternal, OBJC_ASSOCIATION_RETAIN);
}

- (void)clickOperation:(void (^) (void))perform style:(UIControlEvents)style {
    self.back = [TYImplementCallback createImpLementCallback:perform];
    [self addTarget:self.back action:@selector(callback) forControlEvents:style];
}

- (void)outputTextField:(void (^) (id data))dataBlock style:(UIControlEvents)style {
    self.back = [TYImplementCallback outputData:dataBlock];
    [self addTarget:self.back action:@selector(performOutput:) forControlEvents:style];
}

- (BOOL)shuLuQualified:(BOOL (^) (id data))dataBlock style:(UIControlEvents)style {
    self.lnternal = [TYLnternalLmplementation addLnternalLmplementation:dataBlock];
    self.lnternal.stateNameBlock = ^(BOOL state){
//        return state;
    };
    [self addTarget:self.lnternal action:@selector(perform:) forControlEvents:style];
}

@end
