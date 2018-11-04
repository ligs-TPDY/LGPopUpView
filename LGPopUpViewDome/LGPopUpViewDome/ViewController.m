//
//  ViewController.m
//  LGPopUpViewDome
//
//  Created by carnet on 2018/11/4.
//  Copyright © 2018年 TP. All rights reserved.
//

#import "ViewController.h"
#import "LGPopUpView.h"
@interface ViewController ()
@property (nonatomic,strong) LGPopUpView *popUpView;
@property (nonatomic,assign) BOOL isShow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}
- (LGPopUpView *)popUpView
{
    if (!_popUpView) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 300)];
        _popUpView = [LGPopUpView addShowSubView:view];
        view.backgroundColor = [UIColor orangeColor];
    }
    return _popUpView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.popUpView popView];
}
@end
