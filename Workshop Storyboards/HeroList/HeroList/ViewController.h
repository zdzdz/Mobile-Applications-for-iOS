//
//  ViewController.h
//  HeroList
//
//  Created by Sam Son on 1/22/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,
    UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewHeroes;
@property (weak, nonatomic) IBOutlet UITextField *insertHeroName;
@property (weak, nonatomic) IBOutlet UITextField *insertHeroPower;

- (IBAction)tapAddHero:(id)sender;


@end

