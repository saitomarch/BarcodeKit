//
//  QRCodeGenerator.h
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

@import Foundation;
#if TARGET_OS_IOS
@import UIKit;
#else
@import Cocoa;
#endif
@import CoreImage;

/// QRCode generator
@interface QRCodeGenerator : CommonGenerator

/// The error correction. The default value is `QRCodeErrorCorrectionLow`
@property QRCodeErrorCorrection errorCorrection;

@end
