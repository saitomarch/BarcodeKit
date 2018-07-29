//
//  CommonGenerator.m
//  BarcodeKit
//
//  Created by SAITO Tomomi on 2018/07/23.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

#import "CommonGenerator.h"
#import "CIImage+NonInterpolatedImage.h"

@implementation CommonGenerator
#pragma mark - Initializers
- (instancetype)init {
    self = [super init];
    if (self) {
        _color = CIColor.blackColor;
        _backgroundColor = CIColor.whiteColor;
        _size = CGSizeMake(200.0, 200.0);
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data {
    self = [self init];
    if (self) {
        _data = data;
    }
    return self;
}

- (instancetype)initWithString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) {
        return nil;
    } else {
        self = [self init];
        if (self) {
            _data = data;
        }
    }
    return self;
}

- (instancetype)initWithURL:(NSURL *)url {
    NSData *data = [url.absoluteString dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) {
        return nil;
    } else {
        self = [self init];
        if (self) {
            _data = data;
        }
    }
    return self;
}

#pragma mark - Generate QRCode
#if TARGET_OS_IOS
- (UIImage *)image {
    CIImage *ciImage = self.CIImage;
    if (!ciImage) {
        return nil;
    }
    
    CGSize ciImageSize = ciImage.extent.size;
    CGFloat widthRatio = _size.width / ciImageSize.width;
    CGFloat heightRatio = _size.height / ciImageSize.height;
    
    return [ciImage nonInterpolatedImageWithScale:CGSizeMake(widthRatio, heightRatio)];
}
#else
- (NSImage *)image {
    CIImage *ciImage = self.CIImage;
    if (!ciImage) {
        return nil;
    }
    CGSize ciImageSize = ciImage.extent.size;
    CGFloat widthRatio = _size.width / ciImageSize.width;
    CGFloat heightRatio = _size.height / ciImageSize.height;
    
    return [ciImage nonInterpolatedImageWithScale:CGSizeMake(widthRatio, heightRatio)];
}
#endif

- (CIImage *)CIImage {
    [NSException raise:@"CommonGeneratorNotImplementatedException"
                format:@"This method cannot be called directly."];
    return nil;
}

@end
