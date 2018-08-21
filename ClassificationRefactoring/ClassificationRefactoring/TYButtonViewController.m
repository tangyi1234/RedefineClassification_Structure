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
@property (nonatomic, weak) UIButton* but;
@end

@implementation TYButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initButView];
}

- (void)initButView {
    /*
     enum {
     UIControlStateNormal = 0, 常规状态显现
     UIControlStateHighlighted = 1 << 0, 高亮状态显现
     UIControlStateDisabled = 1 << 1, 禁用的状态才会显现
     UIControlStateSelected = 1 << 2, 选中状态
     UIControlStateApplication = 0x00FF0000, 当应用程序标志时
     UIControlStateReserved = 0xFF000000 为内部框架预留，可以不管他
     };
     */
    UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 70, 200, 40);
    [but setImage:[UIImage imageNamed:@"btn_bag_gray"] forState:UIControlStateNormal];
    [but setImage:[UIImage imageNamed:@"btn_bag_red"] forState:UIControlStateSelected];
    [self.view addSubview:_but = but];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 140, 300, 40)];
    textField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textField];
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 190, 300, 40)];
    textField1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textField1];
    
    [[[textField addTrigger:^BOOL(id data) {
        UITextField *text = data;
        NSLog(@"输出文案:%@",text.text);
        return text.text.length > 5;
    }] executionStatus] scope:10];
    
    [[textField1 addTrigger:^BOOL(id data) {
        UITextField *text = data;
        NSLog(@"输出文案1:%@",text.text);
        return text.text.length > 8;
    }] executionStatus];
    
    [[but storage].conditions(textField).conditions(textField1)
     buttonClickCallback:^{
         NSLog(@"点击");
     } style:UIControlEventTouchUpInside];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    [_but emptyKvo];
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
