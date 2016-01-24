//
//  ViewController.m
//  HeroList
//
//  Created by Sam Son on 1/22/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property(strong, nonatomic) NSMutableArray *tableData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.tableData = appDelegate.tableData;
    self.tableViewHeroes.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath{
    static NSString *tableIdentifier = @"TableItem";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: tableIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.tableData[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:@"batman.jpg"];
    
    return cell;
}

- (IBAction)tapAddHero:(id)sender {
    NSString *name = self.insertHeroName.text;
    NSString *power = self.insertHeroPower.text;
    
    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy"];
    NSString *formatedDate = [dateFormatter stringFromDate:date];
    
    [self.tableData addObject: [NSString stringWithFormat:@"%@  [%@]  -- %@", name, power, formatedDate]];
    
    [self.tableViewHeroes reloadData];
    
    self.insertHeroName.text = @"";
    self.insertHeroPower.text = @"";
}
@end

