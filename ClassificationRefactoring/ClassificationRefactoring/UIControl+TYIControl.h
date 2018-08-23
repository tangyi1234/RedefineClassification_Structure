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

- (void)monitorStatus:(void (^) (id data))dataBlock style:(UIControlEvents)style;
@end
