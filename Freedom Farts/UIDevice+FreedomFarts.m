//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "UIDevice+FreedomFarts.h"

@implementation UIDevice (FreedomFarts)

+ (BOOL)ffx_isPhone4Inch
{
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone
            && [UIScreen mainScreen].bounds.size.height > 480.0f;
}

@end
