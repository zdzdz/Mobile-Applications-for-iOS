//
//  Battery.h
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatteryType.h"

@interface Battery : NSObject

-(instancetype)init;

-(instancetype)initWithModel: (NSString *) model
                     batType: (BatteryType) type
                   hoursIdle: (NSInteger) hrIdle
                andHoursTalk: (NSInteger) hrTalk;

+(Battery *) battery;

+(Battery *) batteryWithModel: (NSString *) model
                      batType: (BatteryType) type
                    hoursIdle: (NSInteger) hrIdle
                 andHoursTalk: (NSInteger) hrTalk;

@property (nonatomic, strong) NSString *model;
@property (nonatomic, assign) BatteryType batType;
@property NSInteger hoursIdle;
@property NSInteger hoursTalk;
@end
