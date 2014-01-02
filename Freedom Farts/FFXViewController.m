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
#import "FFXWelcomeViewController.h"
#import "UIColor+FreedomFarts.h"

static NSString * const kFFXActionFacebook = @"Facebook";
static NSString * const kFFXActionTwitter = @"Twitter";

@interface FFXViewController () <UIActionSheetDelegate>

@property (copy, nonatomic) NSArray *buttons;

- (void)presentWelcomeView;

@end



@implementation FFXViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gradientView.gradientColors = @[
                                         [UIColor ffx_lightBlueColor],
                                         [UIColor ffx_mediumBlueColor]
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self presentWelcomeView];
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

- (IBAction)actionPressed:(UIBarButtonItem *)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Share"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:kFFXActionFacebook, kFFXActionTwitter, nil];
    [sheet showFromBarButtonItem:sender animated:YES];
}

#pragma mark - Action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

#pragma mark - Utilities

- (void)presentWelcomeView
{
    FFXWelcomeViewController *vc = [FFXWelcomeViewController welcomeView];
    [self presentPopupViewController:vc animationType:MJPopupViewAnimationSlideBottomBottom];
}

@end
