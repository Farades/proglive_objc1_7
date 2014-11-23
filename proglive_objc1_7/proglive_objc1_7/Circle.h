//
//  Circle.h
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

@interface Circle : Figure {
@public
    float _radius;
}

-(id)initWithRadius:(float)radius;
-(id)initWithRandom;
-(NSString*)toString;

@end
