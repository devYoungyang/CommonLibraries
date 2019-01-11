//
//  FirstViewController.m
//  CommonLibraries
//
//  Created by Yang on 2019/1/3.
//  Copyright © 2019年 Yang. All rights reserved.
//

#import "Dog.h"
#import "LoginView.h"
#import "FirstViewController.h"
#import "LoginViewModel.h"
@interface FirstViewController ()
@property (nonatomic,strong)LoginViewModel *model;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:self.model.loginView];
    

}
-(LoginViewModel *)model{
    if (!_model) {
        _model=[[LoginViewModel alloc] init];
    }
    return _model;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.subject) {
        [self.subject sendNext:@"HAHAHA"];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
