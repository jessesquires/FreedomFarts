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

@class BButton;

@interface FFXViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpacingConstraint;

@property (strong, nonatomic) IBOutletCollection(BButton) NSArray *buttons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *buttonSpacingConstraints;

- (IBAction)votePressed:(UIButton *)sender;

- (IBAction)fartPressed:(UIButton *)sender;

- (IBAction)hexedBitsPressed:(UIBarButtonItem *)sender;

- (IBAction)actionPressed:(UIBarButtonItem *)sender;

@end
