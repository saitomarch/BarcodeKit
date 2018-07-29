//
//  CommonGenerator.h
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/23.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

@import Foundation;
#if TARGET_OS_IOS
@import UIKit;
#else
@import Cocoa;
#endif
@import CoreImage;

@interface CommonGenerator : NSObject

/// Data contained in generatted code
@property (nonnull, readonly) NSData *data;

/// Foreground color of the output
/// Defaults to Black
@property (nonnull) CIColor *color;

/// Background color of the output
/// Defaults to white
@property (nonnull) CIColor *backgroundColor;

/// Size of the output
@property CGSize size;

#pragma mark - Initializers

/// Initialize with data
/// @param data Data
/// @return A generator with data
- (nonnull instancetype)initWithData: (nonnull NSData *)data;

/// Initialize with string
/// @param string String data
/// @return A generator with string if success, otherwise nil.
- (nullable instancetype)initWithString: (nonnull NSString *)string;

/// Initialize with URL
/// @param url URL
/// @return A generator with URL if success, otherwise nil.
- (nullable instancetype)initWithURL: (nonnull NSURL *)url;

#pragma mark - Generate QRCode

#if TARGET_OS_IOS
/// The QRCode's UIImage representation
@property (readonly, nullable) UIImage *image;
#else
/// The QRCode's NSImage representation
@property (readonly, nullable) NSImage *image;
#endif

/// The QRCode's CIImage representation
@property (readonly, nullable) CIImage *CIImage;

@end
