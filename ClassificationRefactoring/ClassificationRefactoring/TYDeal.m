//
//  TYDeal.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/17.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYDeal.h"

@implementation TYDeal
+ (BOOL)processingInputBox:(NSMutableArray *)mutableArray{
    if (mutableArray.count > 0) {
        int a = 0;
        for (int i = 0; i < mutableArray.count; i++) {
            NSMutableDictionary *dic = mutableArray[i];
            NSString *str = dic[TEXTFEILD_STATE_KEY];
            BOOL state = [str boolValue];
            if (state) {
                a = a + 1;
            }
            if (a == mutableArray.count) {
                return YES;
            }
        }
    }
    return NO;
}
@end
