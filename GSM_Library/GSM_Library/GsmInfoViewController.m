//
//  GsmInfoViewController.m
//  GSM_Library
//
//  Created by Sam Son on 1/29/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "GsmInfoViewController.h"

@interface GsmInfoViewController()
@property (weak, nonatomic) IBOutlet UIImageView *gsmPictureView;
@property (weak, nonatomic) IBOutlet UILabel *manufacturerLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *batterModelLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursIdleLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursTalkLabel;
@property (weak, nonatomic) IBOutlet UILabel *displaySizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *displayColorsLabel;

@end

@implementation GsmInfoViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"GSM Info";
    
    self.manufacturerLabel.text = self.gsm.manufacturer;
    self.modelLabel.text = self.gsm.model;
    
    if (!self.gsm.price) {
        self.priceLabel.text = [NSString stringWithFormat:@""];

    } else {
        NSString *formattedPrice = [self formatPrice: [NSNumber numberWithFloat: self.gsm.price]];
        self.priceLabel.text = [NSString stringWithFormat:@"%@", formattedPrice];
    }
    
    self.ownerLabel.text = self.gsm.owner;
    
    if (!self.gsm.gsmPhotoUrl || self.gsm.gsmPhotoUrl.length == 0) {
        self.gsmPictureView.image = [UIImage imageNamed:@"smartphone"];
    } else {
        self.gsmPictureView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.gsm.gsmPhotoUrl]]];
    }
    
    self.batterModelLabel.text = self.gsm.battery.model;
    self.batteryTypeLabel.text = [self convertToString: self.gsm.battery.batType];
    
    if (!self.gsm.battery.hoursIdle) {
        self.hoursIdleLabel.text = [NSString stringWithFormat:@""];
    } else {
        self.hoursIdleLabel.text = [NSString stringWithFormat:@"%@ min", [NSNumber numberWithInteger: self.gsm.battery.hoursIdle]];
    }
    
    if (!self.gsm.battery.hoursTalk) {
        self.hoursTalkLabel.text = [NSString stringWithFormat:@""];
    } else {
        self.hoursTalkLabel.text = [NSString stringWithFormat:@"%@ min", [NSNumber numberWithInteger: self.gsm.battery.hoursTalk]];
    }
    
    if (!self.gsm.display.size) {
        self.displaySizeLabel.text = [NSString stringWithFormat:@""];
    } else{
        self.displaySizeLabel.text = [NSString stringWithFormat:@"%@\"", [NSNumber numberWithFloat:self.gsm.display.size]];
    }
    
    if (!self.gsm.display.numberOfColors) {
        self.displayColorsLabel.text = [NSString stringWithFormat:@""];
    } else {
        self.displayColorsLabel.text = [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger: self.gsm.display.numberOfColors]];
    }
}

-(NSString* ) formatPrice: (NSNumber*) price {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *formattedPrice = [numberFormatter stringFromNumber: [NSNumber numberWithFloat:self.gsm.price]];
    return formattedPrice;
}

- (NSString*) convertToString:(BatteryType) type {
    NSString *result = nil;
    
    switch(type) {
        case LiIon:
            result = @"LiIon";
            break;
        case Li_Po:
            result = @"Li-Po";
            break;
        case NiMH:
            result = @"NiMH";
            break;
        case NiCd:
            result = @"NiCd";
            break;
        case Unknown:
            result = @"Unknown";
            break;
        default:
            result = @"unknown";
    }
    
    return result;
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
