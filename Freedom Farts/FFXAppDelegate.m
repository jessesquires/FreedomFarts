//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "FFXAppDelegate.h"
#import "UIColor+FreedomFarts.h"

@implementation FFXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setTintColor:[UIColor ffx_darkBlueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName : [UIFont systemFontOfSize:20.0f],
                                                           NSForegroundColorAttributeName : [UIColor ffx_darkBlueColor]
                                                           }];
    return YES;
}

@end
