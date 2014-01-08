//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "FFXWelcomeViewController.h"
#import "UIColor+FreedomFarts.h"

@interface FFXWelcomeViewController ()

@property (weak, nonatomic) UIViewController *presentingVC;

+ (instancetype)ffx_welcomeView;

- (void)ffx_handleTapGesture:(UITapGestureRecognizer *)tap;

@end



@implementation FFXWelcomeViewController

#pragma mark - Init

+ (instancetype)ffx_welcomeView
{
    FFXWelcomeViewController *vc = [[FFXWelcomeViewController alloc] initWithNibName:NSStringFromClass([FFXWelcomeViewController class])
                                                                              bundle:[NSBundle mainBundle]];
    return vc;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.welcomeLabel.textColor = [UIColor ffx_patrioticBlueColor];
    self.electionLabel.textColor = [UIColor ffx_patrioticRedColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ffx_handleTapGesture:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
}

#pragma mark - Presentation

+ (void)presentWelcomeViewFromViewController:(UIViewController *)fromVC
{
    FFXWelcomeViewController *welcomeVC = [FFXWelcomeViewController ffx_welcomeView];
    welcomeVC.presentingVC = fromVC;
    [fromVC presentPopupViewController:welcomeVC animationType:MJPopupViewAnimationSlideBottomBottom];
}

+ (void)dismissWelcomeViewFromViewController:(UIViewController *)fromVC
{
    [fromVC dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
}

#pragma mark - Gesture recognizers

- (void)ffx_handleTapGesture:(UITapGestureRecognizer *)tap
{
    [self.presentingVC dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideBottomBottom];
}

@end
