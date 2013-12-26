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
#import <BButton/BButton.h>
#import <SAMGradientView/SAMGradientView.h>

@interface FFXViewController ()

@end



@implementation FFXViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Freedom Farts";
    
    self.gradientView.gradientColors = @[
                                         [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f],
                                         [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f],
                                         [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f]
                                         ];
    
    for (UIView *eachView in self.view.subviews) {
        if ([eachView isKindOfClass:[BButton class]]) {
            BButton *btn = (BButton *)eachView;
            [btn setType:BButtonTypeDanger];
            
            if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
                btn.titleLabel.font = [UIFont systemFontOfSize:24.0f];
            }
            else {
                btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
            }
        }
    }
    
    [self.voteButton setColor:[UIColor colorWithWhite:0.25f alpha:1.0f]];
}

#pragma mark - Actions

- (IBAction)votePressed:(UIButton *)sender
{
    
}

- (IBAction)fartPressed:(UIButton *)sender
{
    NSString *soundFileName = [sender.titleLabel.text lowercaseString];
    
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:soundFileName
                                                 extension:kJSQSystemSoundTypeWAV
                                                completion:^{
                                                    //
                                                }];
}

@end
