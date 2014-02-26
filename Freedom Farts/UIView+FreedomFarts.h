//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import <UIKit/UIKit.h>

extern NSString * const kFFXAnimationKeyView;
extern NSString * const kFFXAnimationKeyCompletionBlock;

typedef void (^FFXAnimationCompletionBlock)(BOOL finished);


@interface UIView (FreedomFarts)

- (void)ffx_fadeToValue:(CGFloat)val
               delegate:(id)delegate
             completion:(FFXAnimationCompletionBlock)block;

- (void)ffx_pulseForDuration:(CFTimeInterval)duration
                 repeatCount:(CGFloat)repeatCount
                    delegate:(id)delegate
                  completion:(FFXAnimationCompletionBlock)block;

- (void)ffx_wiggleForDuration:(CFTimeInterval)duration
                  repeatCount:(CGFloat)repeatCount
                     delegate:(id)delegate
                   completion:(FFXAnimationCompletionBlock)block;

- (void)ffx_stretchForDuration:(CFTimeInterval)duration
                   repeatCount:(CGFloat)repeatCount
                      delegate:(id)delegate
                    completion:(FFXAnimationCompletionBlock)block;

- (void)ffx_squeezeForDuration:(CFTimeInterval)duration
                   repeatCount:(CGFloat)repeatCount
                      delegate:(id)delegate
                    completion:(FFXAnimationCompletionBlock)block;

- (void)ffx_swayVertically:(BOOL)vertically
               forDuration:(CFTimeInterval)duration
               repeatCount:(CGFloat)repeatCount
                  delegate:(id)delegate
                completion:(FFXAnimationCompletionBlock)block;

- (void)ffx_spinForDuration:(CFTimeInterval)duration
                repeatCount:(CGFloat)repeatCount
                   delegate:(id)delegate
                 completion:(FFXAnimationCompletionBlock)block;

@end
