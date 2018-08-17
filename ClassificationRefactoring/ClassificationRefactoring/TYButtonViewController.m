//
//  TYButtonViewController.m
//  ClassificationRefactoring
//
//  Created by yitang on 2018/8/12.
//  Copyright © 2018年 yitang. All rights reserved.
//

#import "TYButtonViewController.h"
#import "UIButton+TYButton.h"
#import "UIControl+TYIControl.h"
#import "UITextField+TYTextField.h"
#import "TYImplementCallback.h"
@interface TYButtonViewController ()

@end

@implementation TYButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initButView];
}

- (void)initButView {
    UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 70, 200, 40);
//    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"点击" forState:UIControlStateNormal];
    [but setImage:[UIImage imageNamed:@"btn_bag_gray"] forState:UIControlStateSelected];
    [but setImage:[UIImage imageNamed:@"btn_bag_red"] forState:UIControlStateNormal];
    [self.view addSubview:but];
    but.enabled = NO;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 140, 300, 40)];
    textField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textField];
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 190, 300, 40)];
    textField1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textField1];
    
    
    
//    [but clickOperation:^{
//        NSLog(@"是否点击了");
//    } style:UIControlEventTouchUpInside];
    
//    [textField outputData:^(id data) {
//        UITextField *textField = data;
//        NSLog(@"输出:%@",textField.text);
//    }];
//    
    [[textField addTrigger:^BOOL(id data) {
        UITextField *text = data;
        NSLog(@"输出文案:%@",text.text);
        return text.text.length > 5;
    }] executionStatus];
    
    [[textField1 addTrigger:^BOOL(id data) {
        UITextField *text = data;
        NSLog(@"输出文案1:%@",text.text);
        return text.text.length > 8;
    }] executionStatus];
    
    [[but storage].conditions(textField,@"textFieldState").conditions(textField1,@"textFieldState")
     buttonClickCallback:^{
         NSLog(@"点击");
     } style:UIControlEventTouchUpInside];
    
//    [but.conditions(textField,@"textFieldState").conditions(textField1,@"textFieldState")
//     buttonClickCallback:^{
//         NSLog(@"点击");
//     } style:UIControlEventTouchUpInside];
    
//    [but buttonClickCallback:^{
//        NSLog(@"textField属性是什么:%@",textField.textFieldState);
//        NSLog(@"点击");
//    } style:UIControlEventTouchUpInside];
//
//    [textField addObserver:self
//                forKeyPath:@"textFieldState"
//                   options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
//                   context:nil];
    
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"textFieldState"]) {
//        NSLog(@"%@",[object valueForKey:@"textFieldState"]);
//        NSLog(@"ChangeInfo:%@",change);
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
