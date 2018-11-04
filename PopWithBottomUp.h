//
//  PopWithBottomUp.h
//  qfxtaoguwang
//
//  Created by carnet on 2018/10/17.
//  Copyright © 2018年 qfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopWithBottomUp : UIView
///自定义显示区域的UI
+ (PopWithBottomUp *)addShowSubView:(UIView *)view;
///弹出视图
- (void)popView;
///隐藏视图
- (void)hideView;
@end

@interface PopShowView : UIView
///弹出视图
- (void)popView;
@end
