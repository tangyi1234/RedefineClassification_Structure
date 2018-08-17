//
//  UITextField+TYTextField.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "UITextField+TYTextField.h"
#import "UIControl+TYIControl.h"
#import <objc/runtime.h>
@implementation UITextField (TYTextField)
static void *textFieldStateKey = &textFieldStateKey;
- (NSString *)textFieldState {
    return objc_getAssociatedObject(self, &textFieldStateKey);
}

- (void)setTextFieldState:(NSString *)textFieldState {
    objc_setAssociatedObject(self, &textFieldStateKey, textFieldState, OBJC_ASSOCIATION_RETAIN);
}
- (void)outputData:(void (^) (id data))dataBlock{
    [self outputTextField:dataBlock style:UIControlEventAllEditingEvents];
}

- (UITextField *)addTrigger:(BOOL (^) (id data))outputBlock {
    [self shuLuQualified:outputBlock style:UIControlEventAllEditingEvents];
    return self;
}

- (void)executionStatus {
    [self textFieldState:^(BOOL state) {
        self.textFieldState = [NSString stringWithFormat:@"%hhd",state];
        NSLog(@"executionStatus这里收到的文案:%@",self.textFieldState);
    }];
}

//- (UITextField *(^) (BOOL state))conditions {
//    return ^UITextField *(BOOL state){
//
//    }
//}
@end
