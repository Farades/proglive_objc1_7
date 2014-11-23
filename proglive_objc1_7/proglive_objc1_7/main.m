//
//  main.m
//  proglive_objc1_7
//
//  Created by admin on 23.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTPComputer.h"
#import "MTPTimer.h"
#import "MTPOven.h"
#import "MTPWakeUp.h"
#import "MTPSingleton.h"
#import "chainNonARC.h"


//четвертое задание: конечно по уму некоторое управление памяти перенести в сами классы, наследуемые от Figure. Но тогда для использования их с ARC надо создавать отдельные классы
//Вобщем там суть ясна, кроме одного: Функция getRandomFigure() которая вобщем-то и выделяет память для фигуры. Если там писать после выделения памяти autorelease,
//то в дальнейшем при вызове chainToString в main'e например, получим exception. Я так понял что в этом месте сработал autorelease. Как обойти красиво этот момент, так и не понял.
//В итоге сделал функцию chainDealloc, которая проходит по цепочке и очищает память.
//Также интересно как очищать синглтон, а то он один потом висит в памяти)
//Следующий вопрос: Протоколы с префиксом обзывают?
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Паттерн фасад
        MTPComputer *comp = [[MTPComputer alloc] init];
        [comp start];
        
        //Паттерн Делегирование
        MTPTimer *timer = [[MTPTimer alloc] init];
        
        timer.delegate  = [[MTPWakeUp alloc] init];
        [timer run];
        
        timer.delegate  = [[MTPOven alloc] init];
        [timer run];
        
        //Синглтон
        MTPSingleton *singleton = [MTPSingleton sharedInstance];
        [singleton test];
        
        //Пример использования Cocoa NSDate vs NSDateFormatter, а вообще уже очень много чего использовали: NSString, NSArray, NSDictionary (их изменяемые версии) и т.д.
        NSDateFormatter *df = [NSDateFormatter new];
        [df setDateFormat:@"hh:mm a dd MMMM yyyy"];
        NSString *currentDate = [df stringFromDate:[NSDate date]];
        NSLog(@"%@", currentDate);
        
        Figure* chainFirst = createRandomChain();
        NSLog(@"Длина списка = %i", length(chainFirst));
        NSLog(@"%@", chainToString(chainFirst));
        chainDealloc(chainFirst);
    }
    return 0;
}
