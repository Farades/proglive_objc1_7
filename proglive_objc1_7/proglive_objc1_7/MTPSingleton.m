//
//  MTPSingleton.m
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "MTPSingleton.h"

@implementation MTPSingleton

static MTPSingleton* _sharedInstance = nil;

+(MTPSingleton*) sharedInstance {
    @synchronized(self) {
        if(!_sharedInstance) {
            _sharedInstance = [[MTPSingleton alloc] init];
        }
    }
    return _sharedInstance;
}

-(void)test {
    NSLog(@"Test singleton!");
}

@end
