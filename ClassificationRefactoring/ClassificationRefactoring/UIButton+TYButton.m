//
//  UIButton+TYButton.m
//  ClassificationRefactoring
//
//  Created by yitang on 2018/8/12.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "UIButton+TYButton.h"
#import "UIControl+TYIControl.h"
#import <objc/runtime.h>

@interface UIButton()
@end
@implementation UIButton (TYButton)

- (void)buttonClickCallback:(void (^)(void))seleButBlock style:(UIControlEvents)controlEvents{
//    self.buttonNameBlick = seleButBlock;
//    [self addTarget:self action:@selector(selectorBut) forControlEvents:controlEvents];
    [self clickOperation:seleButBlock style:controlEvents];
}

- (void (^) (BOOL state))conditions{
    return ^(BOOL state){
        
    };
}
@end
