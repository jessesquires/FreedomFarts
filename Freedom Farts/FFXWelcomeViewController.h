//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
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
