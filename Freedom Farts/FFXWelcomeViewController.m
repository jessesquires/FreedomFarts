//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
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
    self.welcomeLabel.textColor = [UIColor ffx_patrioticBlue];
    self.electionLabel.textColor = [UIColor ffx_patrioticRed];
    
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
