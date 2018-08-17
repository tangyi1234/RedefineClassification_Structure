//
//  UITextField+TYTextField.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TYTextField)
@property (nonatomic, strong) NSString *textFieldState;
- (void)outputData:(void (^) (id data))dataBlock;
- (UITextField *)addTrigger:(BOOL (^) (id data))outputBlock;
- (void)executionStatus;
//- (UITextField *(^) (BOOL state))conditions;
@end
