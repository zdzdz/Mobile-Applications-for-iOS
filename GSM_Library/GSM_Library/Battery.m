//
//  Battery.m
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "Battery.h"

@implementation Battery

@synthesize model = _model;
@synthesize batType = _batType;
@synthesize hoursIdle = _hoursIdle;
@synthesize hoursTalk = _hoursTalk;

-(instancetype)init{
    self = [super init];
    if (self) {
    
    }
    return self;
}

- (instancetype)initWithModel:(NSString *)model batType:(BatteryType)type hoursIdle:(NSInteger)hrIdle andHoursTalk:(NSInteger)hrTalk{
    self = [super init];
    if (self) {
        self.model = model;
        self.batType = type;
        self.hoursIdle = hrIdle;
        self.hoursTalk = hrTalk;
    }
    
    return self;
}

+(Battery *) battery{
    return [[Battery alloc] init];
}

+(Battery *) batteryWithModel:(NSString *)model batType:(BatteryType)type hoursIdle:(NSInteger)hrIdle andHoursTalk:(NSInteger)hrTalk{
    return [[Battery alloc] initWithModel:model batType:(BatteryType)type hoursIdle:hrIdle andHoursTalk:hrTalk];
}

- (NSString *)model{
    if (!_model || _model.length == 0) {
        _model = nil;
    }
    
    return _model;
}

-(void)setModel:(NSString *)model{
    _model = model;
}

- (BatteryType)batType{
    return _batType;
}

-(void)setBatType:(BatteryType)batType{
    _batType = batType;
}

- (NSInteger)hoursIdle
{
    return _hoursIdle;
}

- (void)setHoursIdle:(NSInteger)hoursIdle
{
    _hoursIdle = hoursIdle;
}

- (NSInteger)hoursTalk
{
    return _hoursTalk;
}

- (void)setHoursTalk:(NSInteger)hoursTalk{
    _hoursTalk = hoursTalk;
}

@end
