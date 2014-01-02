//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "UIView+FreedomFarts.h"

@implementation UIView (FreedomFarts)

- (void)ffx_fadeToValue:(CGFloat)val
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = 0.5;
    anim.repeatCount = 1.0;
    anim.autoreverses = NO;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.toValue = [NSNumber numberWithFloat:val];
    [self.layer addAnimation:anim forKey:@"kFFXAnimationKeyFade"];
}

@end
