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

@implementation FFXWelcomeViewController

#pragma mark - Init

+ (instancetype)welcomeView
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
}

@end
