//
//  LoginViewModel.m
//  CommonLibraries
//
//  Created by Yang on 2019/1/3.
//  Copyright © 2019年 Yang. All rights reserved.
//
#import <YYKit.h>
#import "LoginViewModel.h"

@implementation LoginViewModel

-(instancetype)init{
    if (self=[super init]) {
        
    }
    return self;
}

-(LoginView *)loginView{
    if (!_loginView) {
        _loginView=[[LoginView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _loginView;
}
@end
