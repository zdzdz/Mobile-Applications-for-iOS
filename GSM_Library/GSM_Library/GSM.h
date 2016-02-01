//
//  GSM.h
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Battery.h"
#import "Display.h"

@interface GSM : NSObject

-(instancetype)init;

-(instancetype)initWithModel: (NSString *) model
             andManufacturer: (NSString *) manufacturer;

-(instancetype)initWithModel: (NSString *) model
                manufacturer: (NSString *) manufacturer
                    andPrice: (NSInteger) price;

-(instancetype)initWithModel: (NSString *) model
                manufacturer: (NSString *) manufacturer
                       price: (NSInteger) price
                    andOwner: (NSString *) owner;

-(instancetype)initWithModel: (NSString *) model
                manufacturer: (NSString *) manufacturer
                       price: (NSInteger) price
                 gsmPhotoUrl: (NSString *) photo
                    andOwner: (NSString *) owner;

-(instancetype)initWithModel: (NSString *) model
                manufacturer: (NSString *) manufacturer
                       price: (NSInteger) price
                 gsmPhotoUrl: (NSString *) photo
                       owner: (NSString *) owner
                     battery: (Battery *) battery
                  andDisplay: (Display *) display;

+(GSM *) gsm;

+(GSM *) gsmWithModel: (NSString *) model
      andManufacturer: (NSString *) manufacturer;

+(GSM *) gsmWithModel: (NSString *) model
         manufacturer: (NSString *) manufacturer
             andPrice: (NSInteger) price;

+(GSM *) gsmWithModel: (NSString *) model
         manufacturer: (NSString *) manufacturer
                price: (NSInteger) price
             andOwner: (NSString *) owner;

+(GSM *) gsmWithModel: (NSString *) model
         manufacturer: (NSString *) manufacturer
                price: (NSInteger) price
          gsmPhotoUrl: (NSString *) photo
             andOwner: (NSString *) owner;

+(GSM *) gsmWithModel: (NSString *) model
         manufacturer: (NSString *) manufacturer
                price: (NSInteger) price
          gsmPhotoUrl: (NSString *) photo
                owner: (NSString *) owner
              battery: (Battery *) battery
           andDisplay: (Display *) display;

@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *manufacturer;
@property NSInteger price;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *gsmPhotoUrl;
@property (nonatomic, strong) Battery *battery;
@property (nonatomic, strong) Display *display;
@end
