//
//  LoginView.m
//  CommonLibraries
//
//  Created by Yang on 2019/1/3.
//  Copyright © 2019年 Yang. All rights reserved.
//

#import <Masonry.h>
@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
         NSLog(@"===%s===",__func__);
        [self addSubview:self.userNameTf];
        [self addSubview:self.passwordTf];
        [self addSubview:self.loginButton];
       
    }
    return self;
}
//- (void)layoutIfNeeded{
//
//}
//-(void)setNeedsLayout{
//
//}
//-(void)setNeedsDisplay{
//
//}
-(void)layoutSubviews{
    NSLog(@"===%s===",__func__);
    self.userNameTf.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 40)
    .widthIs(200)
    .heightIs(30);

    self.passwordTf.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.userNameTf, 20)
    .widthIs(200)
    .heightIs(30);

    self.loginButton.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.passwordTf, 50)
    .widthIs(200)
    .heightIs(40);
    [super layoutSubviews];
}
-(UITextField *)userNameTf{
    if (!_userNameTf) {
        _userNameTf=[[UITextField alloc] initWithFrame:CGRectZero];
        _userNameTf.backgroundColor=[UIColor redColor];
        NSLog(@"===%s===",__func__);
    }
    return _userNameTf;
}
-(UITextField *)passwordTf{
    if (!_passwordTf) {
        _passwordTf=[[UITextField alloc] initWithFrame:CGRectZero];
        _passwordTf.backgroundColor=[UIColor grayColor];
        NSLog(@"===%s===",__func__);
    }
    return _passwordTf;
}
-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor=[UIColor yellowColor];
        [_loginButton setTitle:@"login" forState:UIControlStateNormal];
        NSLog(@"===%s===",__func__);
    }
    return _loginButton;
}
@end
