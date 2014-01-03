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
    [[UINavigationBar appearance] setBarTintColor:[UIColor ffx_patrioticBlueDarkColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName : [UIFont systemFontOfSize:20.0f],
                                                           NSForegroundColorAttributeName : [UIColor whiteColor]
                                                           }];
    
    [[UIToolbar appearance] setBarTintColor:[UIColor ffx_patrioticBlueDarkColor]];
    
    return YES;
}

@end
