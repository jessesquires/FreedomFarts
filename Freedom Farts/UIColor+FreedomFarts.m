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

+ (UIColor *)ffx_lightBlueColor
{
    return [UIColor colorWithHue:211.0f/360.0f
                      saturation:0.5f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (UIColor *)ffx_mediumBlueColor
{
    return [UIColor colorWithHue:211.0f/360.0f
                      saturation:0.8f
                      brightness:0.9f
                           alpha:1.0f];
}

+ (UIColor *)ffx_darkBlueColor
{
    return [UIColor colorWithHue:211.0f/360.0f
                      saturation:0.6f
                      brightness:0.4f
                           alpha:1.0f];
}

+ (UIColor *)ffx_patrioticBlue
{
    return [UIColor colorWithHue:219.0f/360.0f
                      saturation:0.46f
                      brightness:0.39f
                           alpha:1.0f];
}

+ (UIColor *)ffx_patrioticRed
{
    return [UIColor colorWithRed:168.0f/255.0f
                           green:61.0f/255.0f
                            blue:64.0f/255.0f
                           alpha:1.0f];
}

@end
