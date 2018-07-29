//
//  Code128BarcodeGenerator.m
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/23.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

#import "CommonGenerator.h"
#import "Code128BarcodeGenerator.h"

@implementation Code128BarcodeGenerator

@synthesize quietSpace = _quietSpace;

- (void)setQuietSpace:(CGFloat)quietSpace {
    if (quietSpace < 0.0 || 20.0 < quietSpace) {
        [NSException raise:@"Code128BarcodeGeneratorInvalidQuietSpaceException"
                    format:@"Invalid QuietSpace. It must be 0.0 〜 20.0."];
    }
    _quietSpace = quietSpace;
}

#pragma mark - Initializers
- (instancetype)init {
    self = [super init];
    if (self) {
        self.size = CGSizeMake(200.0, 40.0);
        _quietSpace = 7.0;
    }
    return self;
}

- (instancetype)initWithString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSASCIIStringEncoding];
    if (!data) {
        return nil;
    } else {
        self = [self initWithData:data];
        if (self) {
        }
    }
    return self;
}

- (instancetype)initWithURL:(NSURL *)url {
    NSData *data = [url.absoluteString dataUsingEncoding:NSASCIIStringEncoding];
    if (!data) {
        return nil;
    } else {
        self = [self initWithData:data];
        if (self) {
        }
    }
    return self;
}

- (CIImage *)CIImage {
    CIFilter *barcodeFilter = [CIFilter filterWithName:@"Code128BarcodeGenerator"];
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    if (!barcodeFilter || !colorFilter) {
        return nil;
    }
    
    [barcodeFilter setDefaults];
    [barcodeFilter setValue:self.data forKey:@"inputMessage"];
    [barcodeFilter setValue:@(_quietSpace) forKey:@"inputQuietSpace"];
    
    [colorFilter setDefaults];
    [colorFilter setValue:barcodeFilter.outputImage forKey:@"inputImage"];
    [colorFilter setValue:self.color forKey:@"inputColor0"];
    [colorFilter setValue:self.backgroundColor forKey:@"inputColor1"];
    
    return colorFilter.outputImage;
}

@end
