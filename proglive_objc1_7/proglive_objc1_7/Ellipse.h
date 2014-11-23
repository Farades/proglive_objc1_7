//
//  Ellipse.h
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

@interface Ellipse : Figure {
@public
    float _semimajorAxis;
    float _semiminorAxis;
}

-(id)initWithSemimajorAxis:(float)semimajorAxis semiminorAxis:(float)semiminorAxis;
-(id)initWithRandom;
-(NSString*)toString;

@end
