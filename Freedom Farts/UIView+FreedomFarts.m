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

- (void)ffx_fadeToValue:(CGFloat)val
               delegate:(id)delegate
             completion:(FFXAnimationCompletionBlock)block
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
    
    if (block) {
        [anim setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [self.layer addAnimation:anim forKey:@"kFFXAnimationKeyWiggleBegin"];
}

- (void)ffx_stretchForDuration:(CFTimeInterval)duration
                   repeatCount:(CGFloat)repeatCount
                      delegate:(id)delegate
                    completion:(FFXAnimationCompletionBlock)block
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = duration;
    anim.repeatCount = repeatCount;
    anim.autoreverses = YES;
    anim.removedOnCompletion = YES;
    anim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1f, 5.0f, 1.0f)];
    anim.delegate = delegate;
    [anim setValue:self forKey:kFFXAnimationKeyView];
    
    if (block) {
        [anim setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [self.layer addAnimation:anim forKey:@"kFFXAnimationKeyStretch"];
}

- (void)ffx_squeezeForDuration:(CFTimeInterval)duration
                   repeatCount:(CGFloat)repeatCount
                      delegate:(id)delegate
                    completion:(FFXAnimationCompletionBlock)block
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = duration;
    anim.repeatCount = repeatCount;
    anim.autoreverses = YES;
    anim.removedOnCompletion = YES;
    anim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2f, 0.9f, 1.0f)];
    anim.delegate = delegate;
    [anim setValue:self forKey:kFFXAnimationKeyView];
    
    if (block) {
        [anim setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [self.layer addAnimation:anim forKey:@"kFFXAnimationKeySqueeze"];
}

- (void)ffx_swayVertically:(BOOL)vertically
               forDuration:(CFTimeInterval)duration
               repeatCount:(CGFloat)repeatCount
                  delegate:(id)delegate
                completion:(FFXAnimationCompletionBlock)block
{
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = [NSNumber numberWithFloat:M_PI * 0.05f];
    rotate.toValue = [NSNumber numberWithFloat:M_PI * -0.05f];
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:vertically ? @"position.y" : @"position.x"];
    
    if (!vertically) {
        move.fromValue = [NSNumber numberWithFloat:self.center.x - 25.0f];
        move.toValue = [NSNumber numberWithFloat:self.center.x + 25.0f];
    }
    else {
        move.toValue = [NSNumber numberWithFloat:self.center.y - 45.0];
    }
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:rotate, move, nil];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    group.duration = duration;
    group.repeatCount = repeatCount;
    group.autoreverses = YES;
    group.removedOnCompletion = YES;
    group.delegate = delegate;
    [group setValue:self forKey:kFFXAnimationKeyView];
    
    if (block) {
        [group setValue:block forKey:kFFXAnimationKeyCompletionBlock];
    }
    
    [self.layer addAnimation:group forKey:@"kFFXAnimationKeySway"];
}

@end
