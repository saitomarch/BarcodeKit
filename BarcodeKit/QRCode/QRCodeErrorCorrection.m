//
//  QRCodeErrorCorrection.m
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

#import "QRCodeErrorCorrection.h"

NSString *_Nonnull const QRCodeErrorCorrectionString(QRCodeErrorCorrection correction) {
    switch (correction) {
    case QRCodeErrorCorrectionLow:
        return @"L";
    case QRCodeErrorCorrectionMedium:
        return @"M";
    case QRCodeErrorCorrectionQuartile:
        return @"Q";
    case QRCodeErrorCorrectionHigh:
        return @"H";
    default:
        [NSException raise:@"QRCodeErrorCorrectionInvalidValueException" format:@"Invalid QRCodeErrorCorrection value."];
        return @"";
    }
}
