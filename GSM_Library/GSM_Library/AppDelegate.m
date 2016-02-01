//
//  AppDelegate.m
//  GSM_Library
//
//  Created by Sam Son on 1/27/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.data = [[GsmData alloc] init];
    
    NSArray *testGsms = [NSArray arrayWithObjects:
                         [GSM gsmWithModel:@"Z5" manufacturer:@"Sony" price:999 gsmPhotoUrl:@"http://cdn1.knowyourmobile.com/sites/knowyourmobilecom/files/styles/gallery_wide/public/2015/09/z5_white_group.png" owner:@"John" battery:[Battery batteryWithModel:@"Zir" batType:LiIon hoursIdle:300 andHoursTalk:150] andDisplay:[Display displayWithSize:4.7f andNumberOfColors:16000000]],
                         [GSM gsmWithModel:@"Galaxy S6 Plus" manufacturer:@"Samsung" price:1200 gsmPhotoUrl:@"http://www.samsung.com/global/galaxy/galaxys6/galaxy-s6-edge/images/galaxy-s6-edge_gallery_front_black.png" owner:@"Sam" battery:[Battery batteryWithModel:@"Gat" batType:Li_Po hoursIdle:310 andHoursTalk:180] andDisplay:[Display displayWithSize:5.1f andNumberOfColors:16000000]],
                         [GSM gsmWithModel:@"A5" andManufacturer:@"Samsung"],
                         nil];
    
    [testGsms enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.data addPhone:obj];
    }];
                         
   return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
