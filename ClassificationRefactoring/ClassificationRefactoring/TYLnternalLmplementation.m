//
//  TYLnternalLmplementation.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/15.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYLnternalLmplementation.h"
typedef void (^sendDataBlock) (id data);

@interface TYLnternalLmplementation()
@property (nonatomic, copy) sendDataBlock sendDataNameBlock;
@property (nonatomic, assign) NSInteger numerical;
@end
@implementation TYLnternalLmplementation

+ (instancetype)addDelivery:(void (^) (id data))data {
    TYLnternalLmplementation *lnternal = [[TYLnternalLmplementation alloc] init];
    lnternal->_sendDataNameBlock = data;
    return lnternal;
}


- (void)delivery:(id)data{
    if (_sendDataNameBlock) {
        _sendDataNameBlock(data);
    }
}
@end
