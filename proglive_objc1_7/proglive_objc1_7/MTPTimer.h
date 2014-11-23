//
//  MTPTimer.h
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimerAction.h"

@interface MTPTimer : NSObject {
    id<TimerAction> _delegate;
}

@property(nonatomic, readwrite) id<TimerAction> delegate;

-(void)run;

@end
