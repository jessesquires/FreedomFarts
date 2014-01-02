//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "UIDevice+FreedomFarts.h"

@implementation UIDevice (FreedomFarts)

+ (BOOL)ffx_isPhone4Inch
{
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone
            && [UIScreen mainScreen].bounds.size.height > 480.0f;
}

@end
