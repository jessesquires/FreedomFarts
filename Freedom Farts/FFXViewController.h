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

@class SAMGradientView, BButton;

@interface FFXViewController : UIViewController

@property (weak, nonatomic) IBOutlet SAMGradientView *gradientView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpacingConstraint;

@property (strong, nonatomic) IBOutletCollection(BButton) NSArray *buttons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *buttonSpacingConstraints;

- (IBAction)votePressed:(UIButton *)sender;

- (IBAction)fartPressed:(UIButton *)sender;

- (IBAction)hexedBitsPressed:(UIBarButtonItem *)sender;

- (IBAction)actionPressed:(UIBarButtonItem *)sender;

@end
