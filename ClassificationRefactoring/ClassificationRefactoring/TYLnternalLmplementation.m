//
//  TYLnternalLmplementation.m
//  ClassificationRefactoring
//
//  Created by 汤义 on 2018/8/15.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYLnternalLmplementation.h"
typedef BOOL (^performBlock) (id data);

@interface TYLnternalLmplementation()
@property (nonatomic, copy) performBlock performNameBlock;
@property (nonatomic, assign) NSInteger numerical;
@end
@implementation TYLnternalLmplementation
+ (instancetype)addLnternalLmplementation:(BOOL (^) (id data))dataBlock {
    TYLnternalLmplementation *lnternal = [[TYLnternalLmplementation alloc] init];
    lnternal->_performNameBlock = dataBlock;
    return lnternal;
}

- (void)perform:(id)data {
    UITextField *textField = data;
    NSString *textFieldStr = textField.text;
    textFieldStr = [[textFieldStr componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    if (_numerical != nil){
        if (textFieldStr.length > _numerical + 1) {
            textFieldStr = [textFieldStr substringToIndex:_numerical];
            textField.text = textFieldStr;
        }
    }
    
    BOOL state;
    if (_performNameBlock) {
       state = _performNameBlock(textField);
        if (_stateNameBlock) {
            _stateNameBlock(state);
        }
    }
}

- (void)assignmentScope:(NSInteger)numerical {
    _numerical = numerical;
}
@end
