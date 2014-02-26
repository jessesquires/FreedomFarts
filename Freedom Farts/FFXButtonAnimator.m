//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "FFXButtonAnimator.h"
#import "UIView+FreedomFarts.h"

@implementation FFXButtonAnimator

- (void)animateFartSpangledBanner:(UIButton *)button
{
    [button ffx_pulseForDuration:0.5 repeatCount:2.0f delegate:self completion:^(BOOL finished) {
        if (finished) {
            double delayInSeconds = 0.18;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
                [button ffx_wiggleForDuration:0.62 repeatCount:11.0f delegate:self completion:^(BOOL finished) {
                    [button.layer removeAllAnimations];
                }];
            });
        }
        else {
            [button.layer removeAllAnimations];
        }
    }];
}

- (void)animateAmericaTheFart:(UIButton *)button
{
    [button ffx_swayVertically:NO forDuration:0.75 repeatCount:15.0f delegate:self completion:^(BOOL finished) {
        [button.layer removeAllAnimations];
    }];
}

- (void)animateMyFartTisOfThee:(UIButton *)button
{
    [button ffx_swayVertically:YES forDuration:0.75 repeatCount:9.0f delegate:self completion:^(BOOL finished) {
        [button.layer removeAllAnimations];
    }];
}

- (void)animateBattleFarts:(UIButton *)button
{
    // TODO:
}

- (void)animateGodFartAmerica:(UIButton *)button
{
    [button ffx_stretchForDuration:1.1 repeatCount:14.0f delegate:self completion:^(BOOL finished) {
        [button.layer removeAllAnimations];
    }];
}

- (void)animateYankeeFarter:(UIButton *)button
{
    [button ffx_squeezeForDuration:0.33 repeatCount:18.0f delegate:self completion:^(BOOL finished) {
        [button.layer removeAllAnimations];
    }];
}

#pragma mark - Core animation delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    FFXAnimationCompletionBlock block = [anim valueForKey:kFFXAnimationKeyCompletionBlock];
    if (block) {
        block(flag);
    }
}

@end
