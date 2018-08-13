//
//  UIButton+TYButton.m
//  ClassificationRefactoring
//
//  Created by yitang on 2018/8/12.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "UIButton+TYButton.h"
#import <objc/runtime.h>
typedef void (^buttonBlock) (void);
@interface UIButton()
@property (nonatomic, copy) buttonBlock buttonNameBlick;
@end
@implementation UIButton (TYButton)
static void *buttonNameBlickKey = &buttonNameBlickKey;
- (buttonBlock)buttonNameBlick{
    return objc_getAssociatedObject(self, &buttonNameBlickKey);
}

- (void)setButtonNameBlick:(buttonBlock)buttonNameBlick {
    objc_setAssociatedObject(self, &buttonNameBlickKey, buttonNameBlick, OBJC_ASSOCIATION_COPY);
}

- (void)buttonClickCallback:(void (^)(void))seleButBlock style:(UIControlEvents)controlEvents{
    self.buttonNameBlick = seleButBlock;
    [self addTarget:self action:@selector(selectorBut) forControlEvents:controlEvents];
}

- (void)selectorBut{
    if (self.buttonNameBlick) {
        self.buttonNameBlick();
    }
}
@end
