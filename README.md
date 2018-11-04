# LGPopUpView
#### 需要调用的接口
    ///自定义显示区域的UI
    + (PopWithBottomUp *)addShowSubView:(UIView *)view;
    ///弹出视图
    - (void)popView;
    ///隐藏视图
    - (void)hideView;
#### 使用示例
# LGPopUpView
#### 需要调用的接口
    ///自定义显示区域的UI
    + (PopWithBottomUp *)addShowSubView:(UIView *)view;
    ///弹出视图
    - (void)popView;
    ///隐藏视图
    - (void)hideView;
#### 使用示例
    #import "ViewController.h"
    #import "LGPopUpView.h"
    @interface ViewController ()
    @property (nonatomic,strong) LGPopUpView *popUpView;
    @end
    
    @implementation ViewController
    
    - (void)viewDidLoad {
        [super viewDidLoad];
        
        self.view.backgroundColor = [UIColor redColor];
    }
    - (LGPopUpView *)popUpView
    {
        if (!_popUpView) {
            ///这里的view是自己自定义的弹出界面
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


