//
//  ViewController.m
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "GsmTableViewController.h"

#import "AppDelegate.h"
#import "AddGsmViewController.h"

#import "GSM.h"
#import "GsmInfoViewController.h"

@interface GsmTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableViewGsm;

@end

@implementation GsmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addBarButton =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector(showAddButton)];
    
    self.title = @"GSM Libray";
    self.navigationItem.rightBarButtonItem = addBarButton;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tableViewGsm.delegate = self;
    self.tableViewGsm.dataSource = self;
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.allPhones = [delegate.data phones];
    
    [self.tableViewGsm reloadData];
}

-(void) showAddButton {
    NSString *storyBoardId = @"addGsmScene";
    
    AddGsmViewController *addGsmVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:addGsmVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allPhones.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath{
    static NSString *tableIdentifier = @"TableItem";
    
    UITableViewCell *originalCell =[tableView dequeueReusableCellWithIdentifier: tableIdentifier];
    
    if(originalCell == nil){
        originalCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    GSM *gsm = [self.allPhones objectAtIndex:indexPath.row];
    
    originalCell.textLabel.text = [NSString stringWithFormat:@"%@  %@", gsm.manufacturer,
                                   gsm.model];
    UIImage *gsmPicture = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: gsm.gsmPhotoUrl]]];
    
    if(gsmPicture == nil){
        gsmPicture = [UIImage imageNamed:@"smartphone"];
    }
    
    originalCell.imageView.image = gsmPicture;
    
    return originalCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    GSM *gsm = [self.allPhones objectAtIndex:indexPath.row];
    
    NSString *gsmInfoViewId = @"GsmInfo";
    
    GsmInfoViewController *infoVC = [self.storyboard instantiateViewControllerWithIdentifier:gsmInfoViewId];
    infoVC.gsm = gsm;
    
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        [delegate.data deletePhone:[self.allPhones objectAtIndex:indexPath.row]];
        self.allPhones = [delegate.data phones];
        [self.tableViewGsm deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}

@end
