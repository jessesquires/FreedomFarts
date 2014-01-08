//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "FFXViewController.h"

#import <Social/Social.h>
#import <JSQSystemSoundPlayer/JSQSystemSoundPlayer.h>
#import <BButton/BButton.h>
#import <SVWebViewController/SVWebViewController.h>

#import "FFXWelcomeViewController.h"
#import "UIColor+FreedomFarts.h"
#import "UIDevice+FreedomFarts.h"
#import "UIView+FreedomFarts.h"
#import "UIAlertView+FreedomFarts.h"
#import "UIImage+FreedomFarts.h"

static NSString * const kFFXActionFacebook = @"Facebook";
static NSString * const kFFXActionTwitter = @"Twitter";

@interface FFXViewController () <UIActionSheetDelegate>

@property (assign, nonatomic) BOOL isFirstLaunch;
@property (copy, nonatomic) NSString *currentSound;

- (void)ffx_presentWelcomeView;

- (void)ffx_toggleButtonsEnabled:(BOOL)enabled sender:(UIButton *)sender;

- (void)ffx_displaySocialComposerSheetwithService:(NSString *)service;

@end



@implementation FFXViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isFirstLaunch = YES;
    
    self.imageView.image = [[UIImage imageNamed:@"capitol"] ffx_blurredImageWithBlurValue:0.6f];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.layer.opacity = 0.6f;
    
    for (BButton *eachBtn in self.buttons) {
        if ([eachBtn.titleLabel.text isEqualToString:@"Vote!"]) {
            [eachBtn setColor:[UIColor colorWithWhite:0.25f alpha:1.0f]];
        }
        else {
            [eachBtn setColor:[UIColor ffx_patrioticRedColor]];
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
    [self ffx_presentWelcomeView];
}

#pragma mark - Status bar

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Actions

- (IBAction)votePressed:(UIButton *)sender
{
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:@"fart-short" extension:kJSQSystemSoundTypeWAV];
    SVWebViewController *vc = [[SVWebViewController alloc] initWithAddress:@"http://vote411.org"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)fartPressed:(UIButton *)sender
{
    [self.view bringSubviewToFront:sender];
    [self ffx_toggleButtonsEnabled:NO sender:sender];
    
    self.currentSound = [sender.titleLabel.text lowercaseString];
    
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:self.currentSound
                                                 extension:kJSQSystemSoundTypeWAV
                                                completion:^{
                                                    [self ffx_toggleButtonsEnabled:YES sender:nil];
                                                }];
}

- (IBAction)hexedBitsPressed:(UIBarButtonItem *)sender
{
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:@"fart-high" extension:kJSQSystemSoundTypeWAV];
    SVWebViewController *vc = [[SVWebViewController alloc] initWithAddress:@"http://hexedbits.com"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)actionPressed:(UIBarButtonItem *)sender
{
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:@"fart-high" extension:kJSQSystemSoundTypeWAV];
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Tell your friends that you've joined the Fart Party! In God, We Fart."
                                                       delegate:self
                                              cancelButtonTitle:nil
                                         destructiveButtonTitle:@"I only fart in private"
                                              otherButtonTitles:@"Facebook", @"Twitter", nil];
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
        [self ffx_toggleButtonsEnabled:YES sender:nil];
        [[JSQSystemSoundPlayer sharedPlayer] stopSoundWithFilename:self.currentSound];
    }
}

#pragma mark - Action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self ffx_displaySocialComposerSheetwithService:SLServiceTypeFacebook];
    }
    else if (buttonIndex == 2) {
        [self ffx_displaySocialComposerSheetwithService:SLServiceTypeTwitter];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:@"fart-long" extension:kJSQSystemSoundTypeWAV];
}

#pragma mark - Social

- (void)ffx_displaySocialComposerSheetwithService:(NSString *)service
{
    if (![SLComposeViewController isAvailableForServiceType:service]) {
        if ([service isEqualToString:SLServiceTypeFacebook]) {
            [UIAlertView ffx_showNoFacebookAlert];
        }
        else if ([service isEqualToString:SLServiceTypeTwitter]) {
            [UIAlertView ffx_showNoTwitterAlert];
        }
        return;
    }
    
    SLComposeViewController *composer = [SLComposeViewController composeViewControllerForServiceType:service];
    [composer setInitialText:@"I've joined the Fart Party! And you can too! #FreedomFartsApp"];
    [composer addURL:[NSURL URLWithString:@"https://freedomfarts.com"]];
    [self presentViewController:composer animated:YES completion:nil];
}

#pragma mark - Utilities

- (void)ffx_presentWelcomeView
{
    if (self.isFirstLaunch) {
        [[JSQSystemSoundPlayer sharedPlayer] playSoundWithName:@"fart-low" extension:kJSQSystemSoundTypeWAV];
        [FFXWelcomeViewController presentWelcomeViewFromViewController:self];
        self.isFirstLaunch = NO;
    }
}

- (void)ffx_toggleButtonsEnabled:(BOOL)enabled sender:(UIButton *)sender
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
