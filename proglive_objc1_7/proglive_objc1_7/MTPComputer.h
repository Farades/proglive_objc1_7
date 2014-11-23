//
//  MTPComputer.h
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTPCPU.h"
#import "MTPMemory.h"
#import "MTPHardDrive.h"

@interface MTPComputer : NSObject {
    @private
    MTPCPU       *_cpu;
    MTPMemory    *_memory;
    MTPHardDrive *_hd;
}

@property(strong, nonatomic,readwrite) MTPCPU *cpu;
@property(strong, nonatomic,readwrite) MTPMemory *memory;
@property(strong, nonatomic,readwrite) MTPHardDrive *hd;

-(id)init;
-(void)start;

@end
