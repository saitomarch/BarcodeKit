//
//  QRCodeErrorCorrection.h
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

@import Foundation;

/// @enum QRCodeErrorCorrection
/// QRCode error correction type.
typedef NS_ENUM(NSUInteger, QRCodeErrorCorrection) {
    //! Low (7%)
    QRCodeErrorCorrectionLow,
    //! Medium (15%)
    QRCodeErrorCorrectionMedium,
    //! Quartile (25%)
    QRCodeErrorCorrectionQuartile,
    //! High (30%)
    QRCodeErrorCorrectionHigh
};

/// QRCode error correction string.
/// @param correction A error correction type
/// @return A string of error correction type
extern NSString *_Nonnull const QRCodeErrorCorrectionString(QRCodeErrorCorrection correction);
