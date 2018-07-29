//
//  QRCodeGenerator.m
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

#import "CommonGenerator.h"
#import "QRCodeErrorCorrection.h"
#import "QRCodeGenerator.h"
#import "CIImage+NonInterpolatedImage.h"

@implementation QRCodeGenerator

#pragma mark - Initializers
- (instancetype)init {
    self = [super init];
    if (self) {
        self.size = CGSizeMake(200.0, 200.0);
        _errorCorrection = QRCodeErrorCorrectionLow;
    }
    return self;
}

- (CIImage *)CIImage {
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    if (!qrFilter || !colorFilter) {
        return nil;
    }
    
    [qrFilter setDefaults];
    [qrFilter setValue:self.data forKey:@"inputMessage"];
    [qrFilter setValue:QRCodeErrorCorrectionString(_errorCorrection) forKey:@"inputCorrectionLevel"];
    
    [colorFilter setDefaults];
    [colorFilter setValue:qrFilter.outputImage forKey:@"inputImage"];
    [colorFilter setValue:self.color forKey:@"inputColor0"];
    [colorFilter setValue:self.backgroundColor forKey:@"inputColor1"];
    
    return colorFilter.outputImage;
    
}

@end
