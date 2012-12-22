//
//  Brain.h
//  Calculator
//
//  Created by Michael Nguyen on 2012-10-27.
//  Copyright (c) 2012 Michael Nguyen. All rights reserved.
//

#import <Foundation/NSArray.h>

@interface Brain : NSObject

-(void)pushOperand:(float)newOperand;
-(float)popOperand;
-(float)performOperation:(NSString *)newOperation;
-(void)clearStack;


@end
