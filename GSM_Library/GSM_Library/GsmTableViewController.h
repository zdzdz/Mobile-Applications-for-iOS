//
//  ViewController.h
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GsmTableViewController : UIViewController <UITableViewDelegate,
UITableViewDataSource, UINavigationControllerDelegate>

@property (strong, nonatomic) NSArray *allPhones;

@end

