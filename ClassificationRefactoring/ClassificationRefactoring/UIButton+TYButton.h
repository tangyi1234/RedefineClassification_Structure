//
//  UIButton+TYButton.h
//  ClassificationRefactoring
//
//  Created by yitang on 2018/8/12.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TYButton)
- (void)buttonClickCallback:(void (^)(void))seleButBlock style:(UIControlEvents)controlEvents;
- (void (^) (BOOL state))conditions;
@end
