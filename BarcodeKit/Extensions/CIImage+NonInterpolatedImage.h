//
//  CIImage+NonInterpolatedImage.h
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

@import CoreImage;
#if TARGET_OS_IOS
@import UIKit;
#else
@import Cocoa;
#endif

@interface CIImage (NonInterpolatedImage)
#if TARGET_OS_IOS
/// Creates an `UIImage` with interpolation disabled and scaled given a scale property
/// @param scale a given scale using to resize the result image
/// @retun an non-interpolated UIImage
- (nullable UIImage *)nonInterpolatedImageWithScale: (CGSize)scale;

/// Creates an `NSImage` with interpolation disabled
/// @retun an non-interpolated UIImage
- (nullable UIImage *)nonInterpolatedImage;
#else
/// Creates an `NSImage` with interpolation disabled and scaled given a scale property
/// @param scale a given scale using to resize the result image
/// @retun an non-interpolated UIImage
- (nullable NSImage *)nonInterpolatedImageWithScale: (CGSize)scale;
/// Creates an `NSImage` with interpolation disabled
/// @retun an non-interpolated UIImage
- (nullable NSImage *)nonInterpolatedImage;
#endif

@end
