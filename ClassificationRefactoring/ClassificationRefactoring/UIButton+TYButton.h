//
//  UIButton+TYButton.h
//  ClassificationRefactoring
//
//  Created by yitang on 2018/8/12.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TYButton)
//储存器
- (UIButton *)storage;
- (void)buttonClickCallback:(void (^)(void))seleButBlock style:(UIControlEvents)controlEvents;
- (UIButton* (^)(id listener))conditions;
//清空kvo
- (void)emptyKvo;
@end
