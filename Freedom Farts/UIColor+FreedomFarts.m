//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2012 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "UIColor+FreedomFarts.h"

@implementation UIColor (FreedomFarts)

+ (UIColor *)ffx_patrioticBlueDark
{
    return [UIColor colorWithHue:211.0f/360.0f
                      saturation:0.6f
                      brightness:0.4f
                           alpha:1.0f];
}

+ (UIColor *)ffx_patrioticBlue
{
    return [UIColor colorWithHue:219.0f/360.0f
                      saturation:0.56f
                      brightness:0.49f
                           alpha:1.0f];
}

+ (UIColor *)ffx_patrioticBlueLight
{
    return [UIColor colorWithHue:219.0f/360.0f
                      saturation:0.56f
                      brightness:0.92f
                           alpha:0.8f];
}

+ (UIColor *)ffx_patrioticRed
{
    return [UIColor colorWithRed:168.0f/255.0f
                           green:61.0f/255.0f
                            blue:64.0f/255.0f
                           alpha:1.0f];
}

@end
