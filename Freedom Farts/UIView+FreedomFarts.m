//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "UIView+FreedomFarts.h"

NSString * const kFFXAnimationKeyView = @"kFFXAnimationKeyView";
NSString * const kFFXAnimationKeyCompletionBlock = @"kFFXAnimationKeyCompletionBlock";


@implementation UIView (FreedomFarts)

- (void)ffx_fadeToValue:(CGFloat)val delegate:(id)delegate completion:(FFXAnimationCompletionBlock)block
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = 0.5;
    anim.repeatCount = 1.0;
    anim.autoreverses = NO;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.toValue = [NSNumber numberWithFloat:val];
    anim.delegate = delegate;
    [anim setValue:self forKey:kFFXAnimationKeyView];
    
    if (block) {
        [anim setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [self.layer addAnimation:anim forKey:@"kFFXAnimationKeyFade"];
}

- (void)ffx_pulseForDuration:(CFTimeInterval)duration
                 repeatCount:(CGFloat)repeatCount
                    delegate:(id)delegate
                  completion:(FFXAnimationCompletionBlock)block
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = duration;
    anim.repeatCount = repeatCount;
    anim.autoreverses = YES;
    anim.removedOnCompletion = YES;
    anim.fromValue = [NSNumber numberWithFloat:1.0f];
    anim.toValue = [NSNumber numberWithFloat:1.24f];
    anim.delegate = delegate;
    [anim setValue:self forKey:kFFXAnimationKeyView];
    
    if (block) {
        [anim setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [self.layer addAnimation:anim forKey:@"kFFXAnimationKeyPulse"];
}

- (void)ffx_wiggleForDuration:(CFTimeInterval)duration
                  repeatCount:(CGFloat)repeatCount
                     delegate:(id)delegate
                   completion:(FFXAnimationCompletionBlock)block
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = duration;
    anim.repeatCount = repeatCount;
    anim.autoreverses = YES;
    anim.removedOnCompletion = YES;
    anim.fromValue = [NSNumber numberWithFloat:M_PI * -0.05f];
    anim.toValue = [NSNumber numberWithFloat:M_PI * 0.05f];
    anim.delegate = delegate;
    [anim setValue:self forKey:kFFXAnimationKeyView];
    
    CABasicAnimation *animEnd = [anim copy];
    animEnd.repeatCount = 1.0f;
    animEnd.fromValue = nil;
    animEnd.toValue = [NSNumber numberWithFloat:0.0f];
    animEnd.autoreverses = NO;
    animEnd.removedOnCompletion = NO;
    animEnd.fillMode = kCAFillModeForwards;

    if (block) {
        [animEnd setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [anim setValue:^(BOOL finished) { [self.layer addAnimation:animEnd forKey:@"kFFXAnimationKeyWiggleEnd"]; }
            forKey:kFFXAnimationKeyCompletionBlock];
    
    CABasicAnimation *animBegin = [animEnd copy];
    animBegin.repeatCount = 1.0f;
    animBegin.fromValue = nil;
    animBegin.toValue = [NSNumber numberWithFloat:[anim.fromValue floatValue]];
    
    [animBegin setValue:^(BOOL finished) { [self.layer addAnimation:anim forKey:@"kFFXAnimationKeyWiggleMain"]; }
                 forKey:kFFXAnimationKeyCompletionBlock];
    
    [self.layer addAnimation:animBegin forKey:@"kFFXAnimationKeyWiggleBegin"];
}

@end
