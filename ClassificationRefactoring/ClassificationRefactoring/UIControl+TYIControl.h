//
//  UIControl+TYIControl.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (TYIControl)
- (void)clickOperation:(void (^) (void))perform style:(UIControlEvents)style;

- (void)outputTextField:(void (^) (id data))dataBlock style:(UIControlEvents)style;

- (void)shuLuQualified:(BOOL (^) (id data))dataBlock style:(UIControlEvents)style;
//返回结果textField
- (void)textFieldState:(void (^) (BOOL state))perform;

- (void)controlWithClickStateAllow:(BOOL)state;
@end
