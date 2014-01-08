//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "FFXAppDelegate.h"
#import "UIColor+FreedomFarts.h"

@implementation FFXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor ffx_patrioticBlueColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName : [UIFont systemFontOfSize:20.0f],
                                                           NSForegroundColorAttributeName : [UIColor whiteColor]
                                                           }];
    
    [[UIToolbar appearance] setBarTintColor:[UIColor ffx_patrioticBlueColor]];
    
    return YES;
}

@end
