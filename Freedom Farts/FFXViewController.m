//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "FFXViewController.h"
#import <JSQSystemSoundPlayer/JSQSystemSoundPlayer.h>

@interface FFXViewController ()

@end



@implementation FFXViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Freedom Farts";
    
    [self.voteButton setColor:[UIColor colorWithWhite:0.25f alpha:1.0f]];
    [self.fartButton0 setType:BButtonTypeDanger];
    [self.fartButton1 setType:BButtonTypeDanger];
    [self.fartButton2 setType:BButtonTypeDanger];
    [self.fartButton3 setType:BButtonTypeDanger];
    [self.fartButton4 setType:BButtonTypeDanger];
    [self.fartButton5 setType:BButtonTypeDanger];
}

#pragma mark - Actions

- (IBAction)votePressed:(UIButton *)sender
{
    
}

- (IBAction)fartPressed:(UIButton *)sender
{
    
}

@end
