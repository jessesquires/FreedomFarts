//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "UIAlertView+FreedomFarts.h"

@implementation UIAlertView (FreedomFarts)

+ (void)ffx_showNoTwitterAlert
{
    [[[UIAlertView alloc] initWithTitle:@"No Twitter Account"
                                message:@"Setup an account in iOS Settings > Twitter."
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil]
     show];
}

+ (void)ffx_showNoFacebookAlert
{
    [[[UIAlertView alloc] initWithTitle:@"No Facebook Account"
                                message:@"Setup an account in iOS Settings > Facebook."
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil]
     show];
}

@end
