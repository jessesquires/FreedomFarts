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

- (void)animateFartSpangledBanner:(UIButton *)button delegate:(id)delegate
{
    [button ffx_pulseForDuration:0.5 repeatCount:2.0f delegate:delegate completion:^(BOOL finished) {
        if (finished) {
            double delayInSeconds = 0.18;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
                [button ffx_wiggleForDuration:0.62 repeatCount:11.0f delegate:delegate completion:^(BOOL finished) {
                    [button.layer removeAllAnimations];
                }];
            });
        }
        else {
            [button.layer removeAllAnimations];
        }
    }];
}

@end
