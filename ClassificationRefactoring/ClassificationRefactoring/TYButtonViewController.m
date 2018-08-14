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
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"点击" forState:UIControlStateNormal];
    [self.view addSubview:but];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 140, 300, 50)];
    textField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textField];
    
    [but buttonClickCallback:^{
        NSLog(@"点击");
    } style:UIControlEventTouchUpInside];
    
    [but clickOperation:^{
        NSLog(@"是否点击了");
    } style:UIControlEventTouchUpInside];
    
    [textField outputData:^(id data) {
        UITextField *textField = data;
        NSLog(@"输出:%@",textField.text);
    }];
}
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
