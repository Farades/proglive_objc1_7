//
//  MTPComputer.m
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "MTPComputer.h"

@implementation MTPComputer

-(id)init {
    self = [super init];
    if (self) {
        self.cpu    = [[MTPCPU alloc] init];
        self.memory = [[MTPMemory alloc] init];
        self.hd     = [[MTPHardDrive alloc] init];
    }
    return self;
}

-(void)start {
    [self.cpu execute];
    [self.memory load];
    [self.hd readBoot];
}

@end
