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
@interface UITextField()
@property (nonatomic, assign) NSInteger numerical;
@end
@implementation UITextField (TYTextField)
static void *textFieldStateKey = &textFieldStateKey;
static void *numericalKey = &numericalKey;
- (NSString *)textFieldState {
    return objc_getAssociatedObject(self, &textFieldStateKey);
}

- (NSInteger)numerical{
    return [objc_getAssociatedObject(self, &numericalKey)integerValue];
}

- (void)setTextFieldState:(NSString *)textFieldState {
    objc_setAssociatedObject(self, &textFieldStateKey, textFieldState, OBJC_ASSOCIATION_COPY);
}

- (void)setNumerical:(NSInteger)numerical{
    NSString *integerStr = [NSString stringWithFormat:@"%ld",(long)numerical];
    objc_setAssociatedObject(self, &numericalKey, integerStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (UITextField *)processingState:(BOOL (^) (id data))outputBlock {
    @weakify_self;
    [self monitorStatus:^(id data) {
        @strongify_self;
        self.textFieldState = [NSString stringWithFormat:@"%d",outputBlock([self qualified:data])];
    } style:UIControlEventAllEditingEvents];
    return self;
}

/**
 设置输入位数
 @param numerical 最多可输入多少位
 */
- (UITextField *)scope:(NSInteger)numerical {
    self.numerical = numerical;
    return self;
}

- (UITextField *)qualified:(id)data {
    UITextField *textField = data;
    NSString *textFieldStr = textField.text;
    textFieldStr = [[textFieldStr componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    if (self.numerical != nil){
        if (textFieldStr.length > self.numerical + 1) {
            textFieldStr = [textFieldStr substringToIndex:self.numerical];
            textField.text = textFieldStr;
        }
    }
    return textField;
}
@end
