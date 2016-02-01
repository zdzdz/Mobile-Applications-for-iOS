//
//  GsmData.h
//  GSM_Library
//
//  Created by Sam Son on 1/29/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GSM.h"

@interface GsmData : NSObject

-(NSArray*) phones;

-(void) addPhone: (GSM *) gsm;

-(void) deletePhone: (GSM *) gsm;

@end
