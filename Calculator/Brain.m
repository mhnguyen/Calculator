//
//  Brain.m
//  Calculator
//
//  Created by Michael Nguyen on 2012-10-27.
//  Copyright (c) 2012 Michael Nguyen. All rights reserved.
//

#import "Brain.h"

@interface Brain()

@property (nonatomic, strong) NSMutableArray *calculatorStack;
@property (nonatomic, strong) NSNumber *stackSize;

@end

@implementation Brain

@synthesize calculatorStack = _calculatorStack;
@synthesize stackSize = _stackSize;

// Only call the instance variable inside the getter and setter (lazy instantiation).
-(NSMutableArray *)calculatorStack{
    // Lazy instantiation. (Kind of takes place of the constructor method)
    if (!_calculatorStack) _calculatorStack = [[NSMutableArray alloc] init];
    return _calculatorStack;
}

-(NSNumber *)stackSize{
    // Lazy Instantiation
    if (!_stackSize) _stackSize = 0;
    
    return _stackSize;
}


//Pushes the new operand on the stack. 
-(void)pushOperand:(float)newOperand{
    
    NSLog(@"I am a pushOperand!! I just pushed %f onto the stack!! ", newOperand);
    //Wrapper class for a float.
    [self.calculatorStack addObject:[NSNumber numberWithFloat:newOperand]];
    ;
}


-(float)popOperand{
    // Saves the last object
    NSNumber *lastNum = [self.calculatorStack lastObject];
    // Removes the last object
    if (lastNum) [self.calculatorStack removeLastObject];
    
    //floatValue - Returns the users value as a float
    return [lastNum floatValue];
}

-(float)performOperation:(NSString *)newOperation{
    float result = 0;
    if ([newOperation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }
    if ([newOperation isEqualToString:@"x"]){
        result = [self popOperand] * [self popOperand];
    }
    if ([newOperation isEqualToString:@"-"]){
        float firstNum = [self popOperand];
        float secondNum = [self popOperand];
        
        return secondNum - firstNum;
    }
    if ([newOperation isEqualToString:@"/"]){
        float firstNum = [self popOperand];
        float secondNum = [self popOperand];
        
        return secondNum / firstNum;
    }
    
    // Adds the results to the stack.
    [self pushOperand:result];
    NSLog(@"The result is: %f", result);
    return result;
}

//Clears the calculator stack.
-(void)clearStack{
    [self.calculatorStack removeAllObjects];
    NSLog(@"I just removed all the numbers on the stack!!");
}

@end
