//
//  AddGsmViewController.m
//  GSM_Library
//
//  Created by Sam Son on 1/29/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "AddGsmViewController.h"

#import "AppDelegate.h"
#import "GSM.h"

@interface AddGsmViewController() <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *manufacturerInputField;
@property (weak, nonatomic) IBOutlet UITextField *modelInputField;
@property (weak, nonatomic) IBOutlet UITextField *ownerInputField;
@property (weak, nonatomic) IBOutlet UITextField *priceInputField;
@property (weak, nonatomic) IBOutlet UITextField *batteryModelInputField;
@property (weak, nonatomic) IBOutlet UIPickerView *batteryTypePicker;
@property (weak, nonatomic) IBOutlet UITextField *hoursIdleInputField;
@property (weak, nonatomic) IBOutlet UITextField *hoursTalkInputField;
@property (weak, nonatomic) IBOutlet UITextField *displaySizeInputField;
@property (weak, nonatomic) IBOutlet UITextField *displayColorsInputField;
@property (weak, nonatomic) IBOutlet UITextField *phonePictureInputField;

@property (weak, nonatomic) IBOutlet UIImageView *previewImage;

@property (strong, nonatomic) NSArray *pickerData;
@property BatteryType batTypePicked;

- (IBAction)addButon:(UIButton *)sender;
- (IBAction)manufacturerCheck:(UITextField *)sender;
- (IBAction)modelCheck:(UITextField *)sender;
- (IBAction)showImage:(id)sender;

@end

@implementation AddGsmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add a new phone";
    
    self.pickerData = [NSArray arrayWithObjects:@"Pick type",@"LiIon", @"Li-Po", @"NiMH", @"NiCd", @"Unknown", nil];
    
    self.batteryTypePicker.dataSource = self;
    self.batteryTypePicker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButon:(UIButton *)sender {
    
    if(!self.batTypePicked){
        self.batTypePicked = Unknown;
    }
    
    if (self.modelInputField.text.length == 0 || self.manufacturerInputField.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Model and manufacturer are mandatory."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
        }];
        
        [alert addAction:defaultAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        GSM *phone = [GSM gsmWithModel:[NSString stringWithFormat:@"%@", self.modelInputField.text]
                          manufacturer:[NSString stringWithFormat:@"%@", self.manufacturerInputField.text]
                                 price:[self.priceInputField.text integerValue]
                           gsmPhotoUrl:self.phonePictureInputField.text
                                 owner:self.ownerInputField.text
                               battery:[Battery batteryWithModel:self.batteryModelInputField.text
                                                         batType: self.batTypePicked
                                                       hoursIdle:[self.hoursIdleInputField.text integerValue]
                                                    andHoursTalk:[self.hoursTalkInputField.text integerValue]]
                            andDisplay:[Display displayWithSize:(CGFloat)[self.displaySizeInputField.text floatValue]
                                              andNumberOfColors:[self.displayColorsInputField.text integerValue]]];
        
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        [delegate.data addPhone:phone];
        
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)manufacturerCheck:(UITextField *)sender {
}


- (IBAction)modelCheck:(UITextField *)sender {
}

- (IBAction)showImage:(id)sender {
    NSURL *url = [NSURL URLWithString:self.phonePictureInputField.text];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    if(image == nil){
        self.previewImage.image = [UIImage imageNamed:@"No_Image_Available"];
    } else {
        self.previewImage.image = image;
    }
    
    
    self.previewImage.layer.masksToBounds = YES;
    self.previewImage.layer.borderColor = [UIColor blackColor].CGColor;
    self.previewImage.layer.borderWidth = 1;
    
    if (self.previewImage.hidden) {
        self.previewImage.hidden = NO;
    } else {
        self.previewImage.hidden = YES;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerData.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    switch(row) {
//        case 0:
//            self.batTypePicked = Unknown;
//            break;
        case 1:
            self.batTypePicked = LiIon;
            break;
        case 2:
            self.batTypePicked = Li_Po;
            break;
        case 3:
            self.batTypePicked = NiMH;
            break;
        case 4:
            self.batTypePicked = NiCd;
            break;
        case 5:
            self.batTypePicked = Unknown;
            break;
        default:
            self.batTypePicked = Unknown;
    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *lbTitle = [[UILabel alloc] init];
    [lbTitle setText:[NSString stringWithFormat:@"%@", self.pickerData[row]]];
    [lbTitle setFont:[UIFont fontWithName:@"Arial" size:17.0]];
    [lbTitle setTextAlignment:NSTextAlignmentCenter];
    
    return lbTitle;
}

@end
