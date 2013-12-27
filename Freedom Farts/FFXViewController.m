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
#import <SVWebViewController/SVWebViewController.h>
#import "UIColor+FreedomFarts.h"

@interface FFXViewController ()

@property (copy, nonatomic) NSArray *buttons;

@end



@implementation FFXViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gradientView.gradientColors = @[
                                         [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f],
                                         [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f],
                                         [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f]
                                         ];
    
    self.buttons = [self.view.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject isKindOfClass:[BButton class]];
    }]];
    
    for (BButton *eachBtn in self.buttons) {
        if ([eachBtn.titleLabel.text isEqualToString:@"Vote!"]) {
            [eachBtn setColor:[UIColor colorWithWhite:0.25f alpha:1.0f]];
        }
        else {
            [eachBtn setType:BButtonTypeDanger];
        }
    }
}

- (void)dealloc
{
    _gradientView = nil;
    _buttons = nil;
}

#pragma mark - Actions

- (IBAction)votePressed:(UIButton *)sender
{
    SVWebViewController *vc = [[SVWebViewController alloc] initWithAddress:@"http://vote411.org"];
    [self.navigationController pushViewController:vc animated:YES];
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

- (IBAction)hexedBitsPressed:(UIBarButtonItem *)sender
{
    SVWebViewController *vc = [[SVWebViewController alloc] initWithAddress:@"http://hexedbits.com"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
