//
//  UIButton+TYButton.m
//  ClassificationRefactoring
//
//  Created by yitang on 2018/8/12.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "UIButton+TYButton.h"
#import "UIControl+TYIControl.h"
#import "NSObject+SimpleKVO.h"
#import "PublicDefines.h"
#import "TYDeal.h"
#import <objc/runtime.h>

#define OBJC @"objc"
#define ATTRIBUTE @"attribute"
@interface UIButton()
@property (nonatomic, strong) NSMutableArray *mutableArray;
@end
@implementation UIButton (TYButton)
static void *mutableArrayKey = &mutableArrayKey;
- (UIButton *)storage {
    self.mutableArray = [NSMutableArray array];
    return self;
}
- (NSMutableArray *)mutableArray {
    return objc_getAssociatedObject(self, &mutableArrayKey);
}

- (void)setMutableArray:(NSMutableArray *)mutableArray{
    objc_setAssociatedObject(self, &mutableArrayKey, mutableArray, OBJC_ASSOCIATION_RETAIN);
}

- (void)buttonClickCallback:(void (^)(void))seleButBlock style:(UIControlEvents)controlEvents{
    self.userInteractionEnabled = NO;
    self.selected = NO;
    [self clickOperation:seleButBlock style:controlEvents];
//    NSLog(@"数组还有多少:%lu",(unsigned long)self.mutableArray.count);
    if (seleButBlock == nil || controlEvents == nil) {
        return;
    }
    for (int i = 0 ; i < self.mutableArray.count; i++) {
        NSMutableDictionary *mutableDic = self.mutableArray[i];
        id objc = mutableDic[OBJC];
        NSString *attributeStr = mutableDic[ATTRIBUTE];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:mutableDic];
//        NSLog(@"获取的两个对象是什么:%@ 属性:%@",objc,attributeStr);
        //主要是用来监听输入框输入的数据是否满足设置的条件
        @weakify_self;
        [objc addKVOForPath:attributeStr withBlock:^(id newValue) {
            @strongify_self;
            NSString *valueStr = newValue;
//            NSLog(@"这是什么值:%@",valueStr);
            //储存每个状态
            [dic setValue:valueStr forKey:TEXTFEILD_STATE_KEY];
            [self.mutableArray replaceObjectAtIndex:i withObject:dic];
            if ([TYDeal processingInputBox:self.mutableArray]) {
                self.userInteractionEnabled = YES;//这个是用来是否禁止交互
                self.selected = YES;
            }else {
                self.userInteractionEnabled = NO;//这个是用来是否禁止交互
                self.selected = NO;
            }
        }];
    }
    
}

- (UIButton* (^)(id listener))conditions{
    return ^UIButton*(id listener){
        NSString *attribute = TEXTFIELDSTATE;
        NSDictionary *dic = @{OBJC:listener,ATTRIBUTE:attribute};
        if (dic != nil) {
            [self.mutableArray addObject:dic];
        }
        return self;
    };
}

- (void)emptyKvo {
    if (self.mutableArray.count > 0) {
        for (int i = 0 ; i < self.mutableArray.count; i++) {
            NSMutableDictionary *mutableDic = self.mutableArray[i];
            id objcs = mutableDic[OBJC];
            [objcs removeAllKVOs];
        }
    }
}
@end
