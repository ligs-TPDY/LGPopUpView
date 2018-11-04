//
//  PopWithBottomUp.h
//  qfxtaoguwang
//
//  Created by carnet on 2018/10/17.
//  Copyright © 2018年 qfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGPopUpView : UIView
///自定义显示区域的UI
+ (LGPopUpView *)addShowSubView:(UIView *)view;
///弹出视图
- (void)popView;
///隐藏视图
- (void)hideView;
@end

@interface PopShowView : UIView
///弹出视图
- (void)popView;
@end
