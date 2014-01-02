//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>
#import <MJPopupViewController/UIViewController+MJPopupViewController.h>

@interface FFXWelcomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *electionLabel;
@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;

+ (void)presentWelcomeViewFromViewController:(UIViewController *)fromVC;

+ (void)dismissWelcomeViewFromViewController:(UIViewController *)fromVC;

@end
