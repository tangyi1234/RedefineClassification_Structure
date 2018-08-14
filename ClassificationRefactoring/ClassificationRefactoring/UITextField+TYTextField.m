//
//  UITextField+TYTextField.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "UITextField+TYTextField.h"
#import "UIControl+TYIControl.h"
@implementation UITextField (TYTextField)
- (void)outputData:(void (^) (id data))dataBlock{
    [self outputTextField:dataBlock style:UIControlEventAllEditingEvents];
}
@end
