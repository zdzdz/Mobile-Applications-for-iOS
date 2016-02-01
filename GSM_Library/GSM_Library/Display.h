//
//  Display.h
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Display : NSObject

-(instancetype)init;

-(instancetype)initWithSize: (CGFloat) size
          andNumberOfColors: (NSInteger) numColors;

+(Display *) display;

+(Display *) displayWithSize: (CGFloat) size
           andNumberOfColors: (NSInteger) numColors;

@property CGFloat size;
@property NSInteger numberOfColors;
@end
