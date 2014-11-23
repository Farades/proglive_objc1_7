//
//  chainNonARC.m
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "chainNonARC.h"

typedef enum {
    circle,
    rectangle,
    ellipse
} FigureType;

Figure* createRandomChain() {
    int n = arc4random_uniform(5) + 7;
    Figure* first = getRandomFigure();
    if (n > 1) {
        Figure* tail = first;
        for (int i = 0; i < n - 1; i++) {
            Figure* temp = getRandomFigure();
            tail->next = temp;
            tail = temp;
        }
    }
    return first;
}

Figure* getRandomFigure() {
    Figure* figure;
    FigureType type = arc4random_uniform(3);
    switch (type) {
        case circle:
            figure = [[Circle alloc] initWithRandom] ;
            break;
            
        case rectangle:
            figure = [[Rectangle alloc] initWithRandom];
            break;
            
        case ellipse:
            figure = [[Ellipse alloc] initWithRandom];
            break;
            
    }
    return figure;
}

unsigned length(Figure* first) {
    int count = 0;
    Figure* temp = first;
    while (temp) {
        temp = temp->next;
        count++;
    }
    return count;
}

NSString* chainToString(Figure* first) {
    NSString* res = @"\n";
    Figure* temp = first;
    int count = 0;
    while (temp) {
        //Каждый объект, наследуемый от Figure умеют конвертировать себя в строку
        NSString* append = [[[NSString alloc] init] autorelease];
        append = [NSString stringWithFormat:@"[%i] %@\n", count, [temp toString]];
        res = [res stringByAppendingString: append];
        temp = temp->next;
        count++;
    }
    return res;
}

void chainDealloc(Figure* first) {
    Figure* current = first;
    Figure* temp = nil;
    while (current) {
        temp = current->next;
        current->next = nil;
        [current release];
        current = temp;
    }
}