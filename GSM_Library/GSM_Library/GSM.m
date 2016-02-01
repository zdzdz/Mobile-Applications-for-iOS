//
//  GSM.m
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "GSM.h"

@implementation GSM

@synthesize model = _model;
@synthesize manufacturer = _manufacturer;
@synthesize price = _price;
@synthesize owner = _owner;
@synthesize gsmPhotoUrl = _gsmPhotoUrl;
@synthesize battery = _battery;
@synthesize display = _display;

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        //initialization code
    }
    return self;
}

- (instancetype)initWithModel:(NSString *)model
              andManufacturer:(NSString *)manufacturer{
    self = [super init];
    if (self) {
        self.model = model;
        self.manufacturer = manufacturer;
    }
    return self;
}

- (instancetype)initWithModel:(NSString *)model
                 manufacturer:(NSString *)manufacturer
                     andPrice:(NSInteger)price{
    self = [super init];
    if (self) {
        self.model = model;
        self.manufacturer = manufacturer;
        self.price = price;
    }
    return self;
}

-(instancetype)initWithModel:(NSString *)model
                manufacturer:(NSString *)manufacturer
                       price:(NSInteger)price
                    andOwner:(NSString *)owner{
    self = [super init];
    if (self) {
        self.model = model;
        self.manufacturer = manufacturer;
        self.price = price;
        self.owner = owner;
    }
    return self;
}

-(instancetype)initWithModel:(NSString *)model
                manufacturer:(NSString *)manufacturer
                       price:(NSInteger)price
                 gsmPhotoUrl:(NSString *) gsmPhotourl
                    andOwner:(NSString *)owner{
    self = [super init];
    if (self) {
        self.model = model;
        self.manufacturer = manufacturer;
        self.price = price;
        self.gsmPhotoUrl = gsmPhotourl;
        self.owner = owner;
    }
    return self;
}

-(instancetype)initWithModel:(NSString *)model
                manufacturer:(NSString *)manufacturer
                       price:(NSInteger)price
                 gsmPhotoUrl:(NSString *) gsmPhotourl
                       owner:(NSString *)owner
                     battery:(Battery *)battery
                  andDisplay:(Display *)display{
    self = [super init];
    if (self) {
        self.model = model;
        self.manufacturer = manufacturer;
        self.price = price;
        self.gsmPhotoUrl = gsmPhotourl;
        self.owner = owner;
        self.battery = battery;
        self.display = display;
    }
    return self;
}

+ (GSM *)gsm{
    return [[GSM alloc] init];
}

+ (GSM *)gsmWithModel:(NSString *)model
      andManufacturer:(NSString *)manufacturer{
    return [[GSM alloc] initWithModel:model andManufacturer:manufacturer];
}

+(GSM *) gsmWithModel:(NSString *)model manufacturer:(NSString *)manufacturer andPrice:(NSInteger)price{
    return [[GSM alloc] initWithModel:model manufacturer:manufacturer andPrice:price];
}

+(GSM *)gsmWithModel:(NSString *)model manufacturer:(NSString *)manufacturer price:(NSInteger)price andOwner:(NSString *)owner {
    return [[GSM alloc] initWithModel:model manufacturer:manufacturer price:price andOwner:owner];
}

+(GSM *)gsmWithModel:(NSString *)model manufacturer:(NSString *)manufacturer price:(NSInteger)price gsmPhotoUrl:(NSString *)photo andOwner:(NSString *)owner{
    return [[GSM alloc] initWithModel:model manufacturer:manufacturer price:price gsmPhotoUrl:photo andOwner:owner];
}

+ (GSM *)gsmWithModel:(NSString *)model manufacturer:(NSString *)manufacturer price:(NSInteger)price gsmPhotoUrl:(NSString *)photo owner:(NSString *)owner battery:(Battery *)battery andDisplay:(Display *)display{
    return [[GSM alloc] initWithModel:model manufacturer:manufacturer price:price gsmPhotoUrl:photo owner:owner battery:battery andDisplay:display];
}

- (NSString *)model{
    
    return _model;
}

- (void)setModel:(NSString *)model{
    if (model.length == 0) {
        _model = nil;
    } else {
        _model = model;
    }
}

- (NSString *)manufacturer{
    return _manufacturer;
}

- (void)setManufaturer:(NSString *)manufacturer{
    if (manufacturer.length == 0) {
        _manufacturer = nil;
    } else {
        _manufacturer = manufacturer;
    }
}

- (NSInteger)price{
    return _price;
}

- (void)setPrice:(NSInteger)price{
    _price = price;
}

- (NSString *)owner{
    return _owner;
}

- (void)setOwner:(NSString *)owner{
    _owner = owner;
}

- (NSString *)gsmPhotoUrl{
    return _gsmPhotoUrl;
}

- (void)setGsmPhotoUrl:(NSString *)gsmPhotoUrl{
    _gsmPhotoUrl = gsmPhotoUrl;
}

- (Battery *)battery{
    if (!_battery) {
        _battery = [[Battery alloc] init];
        _battery.batType = Unknown;
    }
    
    return _battery;
}

- (void)setBattery:(Battery *)battery{
    _battery = battery;
}

- (Display *)display{
    if (!_display) {
        _display = [[Display alloc] init];
    }
    
    return _display;
}

- (void)setDisplay:(Display *)display{
    _display = display;
}

+ (GSM*)iPhone5S{
    return [[GSM alloc] initWithModel:@"iPhone5S"
                         manufacturer:@"Apple"
                                price:1000
                          gsmPhotoUrl: @""
                                owner:@"John"
                              battery:[[Battery alloc] initWithModel:@"Samsung"
                                                             batType:Li_Po
                                                           hoursIdle:300
                                                        andHoursTalk:150]
                           andDisplay:[[Display alloc] initWithSize:4.7f
                                                  andNumberOfColors:16000000]];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"GSM Info - model: %@, manufacturer: %@, price: %ld, owner: %@, gsmPhotoUrl: %@ battery: %@, display: %@",
            self.model, self.manufacturer, self.price, self.owner, self.gsmPhotoUrl, self.battery, self.display];
}

@end
