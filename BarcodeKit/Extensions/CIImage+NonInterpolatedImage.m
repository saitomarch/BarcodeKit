//
//  CIImage+NonInterpolatedImage.m
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

#import "CIImage+NonInterpolatedImage.h"

@implementation CIImage (NonInterpolatedImage)
#if TARGET_OS_IOS
- (UIImage *)nonInterpolatedImageWithScale:(CGSize)scale {
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:self fromRect:self.extent];
    if (!cgImage) {
        return nil;
        
    }
    const CGSize size = CGSizeMake(self.extent.size.width * scale.width, self.extent.size.height * scale.height);
    
    UIGraphicsBeginImageContextWithOptions(size, true, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) {
        return nil;
    }
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextTranslateCTM(context, 0.0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetPathBoundingBox(context), cgImage);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

- (UIImage *)nonInterpolatedImage {
    return [self nonInterpolatedImageWithScale:CGSizeMake(1.0, 1.0)];
}

#else
- (NSImage *)nonInterpolatedImageWithScale:(CGSize)scale {
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:self fromRect:self.extent];
    if (!cgImage) {
        return nil;
    }
    const CGSize size = CGSizeMake(self.extent.size.width * scale.width, self.extent.size.height * scale.height);
    
    NSImage *result = [[NSImage alloc] initWithSize:NSMakeSize(size.width * scale.width, size.height * scale.height)];
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL pixelsWide:size.width pixelsHigh:size.height bitsPerSample:8 samplesPerPixel:4 hasAlpha:true isPlanar:false colorSpaceName:NSCalibratedRGBColorSpace bytesPerRow:0 bitsPerPixel:0];
    if (!rep) {
        return nil;
    }
    
    [result addRepresentation:rep];
    
    [result lockFocus];
    
    CGContextRef context = [NSGraphicsContext currentContext].CGContext;
    if (!context) {
        return nil;
    }
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextTranslateCTM(context, 0.0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetPathBoundingBox(context), cgImage);
    
    [result unlockFocus];
    
    return result;
}

- (NSImage *)nonInterpolatedImage {
    return [self nonInterpolatedImageWithScale:CGSizeMake(1.0, 1.0)];
}

#endif
@end
