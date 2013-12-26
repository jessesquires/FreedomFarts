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
#import <BButton/BButton.h>

@interface FFXViewController : UIViewController

@property (weak, nonatomic) IBOutlet BButton *voteButton;
@property (weak, nonatomic) IBOutlet BButton *fartButton0;
@property (weak, nonatomic) IBOutlet BButton *fartButton1;
@property (weak, nonatomic) IBOutlet BButton *fartButton2;
@property (weak, nonatomic) IBOutlet BButton *fartButton3;
@property (weak, nonatomic) IBOutlet BButton *fartButton4;
@property (weak, nonatomic) IBOutlet BButton *fartButton5;

- (IBAction)votePressed:(UIButton *)sender;

- (IBAction)fartPressed:(UIButton *)sender;

@end
