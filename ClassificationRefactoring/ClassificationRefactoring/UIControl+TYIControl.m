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
@interface UIControl()
@property (nonatomic, strong) TYImplementCallback *back;
@property (nonatomic, strong) TYLnternalLmplementation *lnternal;
@end
@implementation UIControl (TYIControl)
static void *backKey = &backKey;
static void *lnternalKey = &lnternalKey;
- (TYImplementCallback *)back{
    return objc_getAssociatedObject(self, &backKey);
}

- (void)setBack:(TYImplementCallback *)back {
    objc_setAssociatedObject(self, &backKey, back, OBJC_ASSOCIATION_RETAIN);
}

- (void)removeBack{
    objc_removeAssociatedObjects(self);
}

- (TYLnternalLmplementation *)lnternal {
    return objc_getAssociatedObject(self, &lnternalKey);
}

- (void)setLnternal:(TYLnternalLmplementation *)lnternal {
    objc_setAssociatedObject(self, &lnternalKey, lnternal, OBJC_ASSOCIATION_RETAIN);
}

- (void)clickOperation:(void (^) (void))perform style:(UIControlEvents)style {
    if (self.back) {
        [self removeBack];
    }
    self.back = [TYImplementCallback createImpLementCallback:perform];
    [self addTarget:self.back action:@selector(callback) forControlEvents:style];
}


- (void)monitorStatus:(void (^) (id data))dataBlock style:(UIControlEvents)style {
    if (self.lnternal) {
        [self removeBack];
    }
    self.lnternal = [TYLnternalLmplementation addDelivery:dataBlock];
    [self addTarget:self.lnternal action:@selector(delivery:) forControlEvents:style];
}

@end
