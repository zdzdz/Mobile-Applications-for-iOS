//
//  GsmData.m
//  GSM_Library
//
//  Created by Sam Son on 1/29/16.
//  Copyright © 2016 Sam Son. All rights reserved.
//

#import "GsmData.h"

@interface GsmData()

@property NSMutableArray *gsms;

@end

@implementation GsmData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gsms = [NSMutableArray array];
    }
    return self;
}

-(NSArray*) phones{
    return [NSArray arrayWithArray:self.gsms];
}

-(void) addPhone:(GSM *)gsm{
    [self.gsms addObject:gsm];
}

-(void) deletePhone:(GSM *)gsm{
    NSInteger index = [self.gsms indexOfObject:gsm];
    [self.gsms removeObjectAtIndex:index];
}

@end
