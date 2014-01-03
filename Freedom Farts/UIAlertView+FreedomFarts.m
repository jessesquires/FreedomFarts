//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
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
