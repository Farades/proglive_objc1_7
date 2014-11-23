//
//  chainNonARC.h
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "Figure.h"
#import "Circle.h"
#import "Rectangle.h"
#import "Ellipse.h"

#ifndef proglive_objc1_7_chainNonARC_h
#define proglive_objc1_7_chainNonARC_h

Figure* getRandomFigure();
Figure* createRandomChain();
unsigned length(Figure* first);
NSString* chainToString(Figure* first);
void chainDealloc(Figure* frist);

#endif
