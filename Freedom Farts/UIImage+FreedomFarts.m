//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The GPL-3.0 License
//  Copyright (c) 2014 Jesse Squires
//  http://www.gnu.org/licenses
//

#import "UIImage+FreedomFarts.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

@implementation UIImage (FreedomFarts)

- (UIImage *)ffx_blurredImageWithBlurValue:(CGFloat)blur
{
    if (blur < 0.0f) {
        blur = 0.0f;
    }
    else if (blur > 1.0f) {
        blur = 1.0f;
    }
    
    int boxSize = (int)(blur * 40.0f);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef imgRef = self.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(imgRef);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(imgRef);
    inBuffer.height = CGImageGetHeight(imgRef);
    inBuffer.rowBytes = CGImageGetBytesPerRow(imgRef);
    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
    
    void *pixelBuffer = malloc(CGImageGetBytesPerRow(imgRef) * CGImageGetHeight(imgRef));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(imgRef);
    outBuffer.height = CGImageGetHeight(imgRef);
    outBuffer.rowBytes = CGImageGetBytesPerRow(imgRef);
    
    vImage_Error error = (vImage_Error)vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (!error) {
        error = vImageBoxConvolve_ARGB8888(&outBuffer, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        
        if (!error) {
            vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        }
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(outBuffer.data,
                                                 outBuffer.width,
                                                 outBuffer.height,
                                                 8,
                                                 outBuffer.rowBytes,
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    
    CGImageRef imageRef = CGBitmapContextCreateImage (context);
    
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
