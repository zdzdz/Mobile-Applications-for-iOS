//
//  Display.m
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "Display.h"

@implementation Display

@synthesize size = _size;
@synthesize numberOfColors = _numberOfColors;

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithSize:(CGFloat)size andNumberOfColors:(NSInteger)numColors{
    self = [super init];
    if (self) {
        self.size = size;
        self.numberOfColors = numColors;
    }
    
    return self;
}

+ (Display *)display{
    return [[Display alloc] init];
}

+ (Display *)displayWithSize:(CGFloat)size andNumberOfColors:(NSInteger)numColors{
    return [[Display alloc] initWithSize:size andNumberOfColors:numColors];
}

- (CGFloat)size{
    return _size;
}

- (void)setSize:(CGFloat)size{
    _size = size;
}

- (NSInteger)numberOfColors{

    return _numberOfColors;
}

- (void)setNumberOfColors:(NSInteger)numberOfColors{
    _numberOfColors = numberOfColors;
}

@end
