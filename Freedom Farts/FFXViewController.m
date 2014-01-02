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
#import "UIDevice+FreedomFarts.h"
#import "UIView+FreedomFarts.h"

static NSString * const kFFXActionFacebook = @"Facebook";
static NSString * const kFFXActionTwitter = @"Twitter";

@interface FFXViewController () <UIActionSheetDelegate>

@property (copy, nonatomic) NSString *currentSound;

- (void)presentWelcomeView;

- (void)toggleButtonsEnabled:(BOOL)enabled sender:(UIButton *)sender;

@end



@implementation FFXViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gradientView.gradientColors = @[
                                         [UIColor ffx_patrioticBlueLight],
                                         [UIColor ffx_patrioticBlue]
                                         ];
    
    for (BButton *eachBtn in self.buttons) {
        if ([eachBtn.titleLabel.text isEqualToString:@"Vote!"]) {
            [eachBtn setColor:[UIColor colorWithWhite:0.25f alpha:1.0f]];
        }
        else {
            [eachBtn setType:BButtonTypeDanger];
        }
    }
    
    for (NSLayoutConstraint *eachConstraint in self.buttonSpacingConstraints) {
        eachConstraint.constant = [UIDevice ffx_isPhone4Inch] ? 24.0f : 14.0f;
    }
    
    self.topSpacingConstraint.constant = [UIDevice ffx_isPhone4Inch] ? 38.0f : 26.0f;
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
    [self.view bringSubviewToFront:sender];
    [self toggleButtonsEnabled:NO sender:sender];
    
    self.currentSound = [sender.titleLabel.text lowercaseString];
    
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:self.currentSound
                                                 extension:kJSQSystemSoundTypeWAV
                                                completion:^{
                                                    [self toggleButtonsEnabled:YES sender:nil];
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

#pragma mark - Shake event

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake && self.currentSound) {
        [self toggleButtonsEnabled:YES sender:nil];
        [[JSQSystemSoundPlayer sharedPlayer] stopSoundWithFilename:self.currentSound];
    }
}

#pragma mark - Action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

#pragma mark - Utilities

- (void)presentWelcomeView
{
    [FFXWelcomeViewController presentWelcomeViewFromViewController:self];
}

- (void)toggleButtonsEnabled:(BOOL)enabled sender:(UIButton *)sender
{
    self.navigationItem.leftBarButtonItem.enabled = enabled;
    self.navigationItem.rightBarButtonItem.enabled = enabled;
    
    for (BButton *eachButton in self.buttons) {
        eachButton.userInteractionEnabled = enabled;
        
        if (!sender || (sender && ![eachButton isEqual:sender])) {
            eachButton.enabled = enabled;
            [eachButton ffx_fadeToValue:enabled ? 1.0f : 0.25f];
        }
    }
}

@end
