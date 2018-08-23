//
//  UITextField+TYTextField.h
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/14.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TYTextField)
@property (nonatomic, copy) NSString *textFieldState;
- (UITextField *)processingState:(BOOL (^) (id data))outputBlock;

- (UITextField *)scope:(NSInteger)numerical;
@end
