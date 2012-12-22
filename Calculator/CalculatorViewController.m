//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Michael Nguyen on 2012-10-27.
//  Copyright (c) 2012 Michael Nguyen. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Brain.h"
#import <Foundation/Foundation.h>


@interface CalculatorViewController ()


@property (nonatomic) BOOL userIsEnteringNumber;
@property (nonatomic, strong) Brain *calculatorBrain;
@property (nonatomic) BOOL userEnteredDecimal;
@property (nonatomic) BOOL userEnteredNegative;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsEnteringNumber = _userIsEnteringNumber;
@synthesize calculatorBrain = _calculatorBrain;
@synthesize userEnteredDecimal = _userEnteredDecimal;


-(Brain *)calculatorBrain{
    if (!_calculatorBrain) _calculatorBrain = [[Brain alloc] init];
    return _calculatorBrain;
}

// Digit is pressed. 
- (IBAction)digitPressed:(UIButton *)sender {
    // Gets the button title from the button that SENT the digitPressed action.

    NSLog(@"The Button Pressed is: %@", sender.currentTitle);

    // Gets the button sender text.
    if (self.userIsEnteringNumber){
        self.display.text = [self.display.text stringByAppendingString:sender.currentTitle];
    }
    else {
        self.display.text = sender.currentTitle;
        self.userIsEnteringNumber = YES;
    }

}

// Decimal is pressed.
- (IBAction)decimalPressed:(UIButton *)sender {
    NSString *newString = self.display.text;
    
    if (self.userEnteredDecimal == NO){
        newString = [newString stringByAppendingString:@"."];
        self.display.text = newString;
        self.userEnteredDecimal = YES;
    }
}

// Negative symbol is pressed.
- (IBAction)negativePressed:(UIButton *)sender {
    NSString *newString = @"-";
    
    if (self.userEnteredNegative == NO){
            self.display.text = [newString stringByAppendingString:self.display.text];
        self.userEnteredNegative = YES;
    }
}


//Pi button Pressed.
- (IBAction)piPressed:(UIButton *)sender {
    self.display.text = @"3.14159265359";
}

// x^y is pressed
- (IBAction)powerPressed:(UIButton *)sender {
    
}

// Square root operator is pressed.
- (IBAction)sqrtPressed:(UIButton *)sender {
    
}


- (IBAction)delPressed:(UIButton *)sender {
    NSString *delString = self.display.text;
    NSUInteger length = [delString length];
    
    delString = [delString substringToIndex:length-1];
    NSLog(@"The new string is: %@", delString);
    
    length = [delString length];
    if (length == 0){
        self.display.text = @"0";
        self.userIsEnteringNumber = NO;
    }
    else {
        self.display.text = delString;
    }
    
}
// clear is pressed
- (IBAction)clearPressed:(id)sender {
    self.display.text = @"0";
    // Clears the entire Satck
    [self.calculatorBrain clearStack];
    self.userIsEnteringNumber = NO;
    self.userEnteredDecimal = NO;
    self.userEnteredNegative = NO;
}

//Operation is pressed.
- (IBAction)operationPressed:(UIButton *)sender {
    //Depending on what the operation is, we want to do that operation on the last two items of the stack
    NSLog(@"I just pushed the %@ button. ", sender.currentTitle);
    
    if (self.userIsEnteringNumber == YES) [self enterPressed:NULL];
    
    float result;
    
    if ([sender.currentTitle isEqualToString:@"+"]){
        NSLog(@"I JUST PRESSED +");
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    if ([sender.currentTitle isEqualToString:@"x"]){
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    if ([sender.currentTitle isEqualToString:@"-"]){
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    if ([sender.currentTitle isEqualToString:@"/"]){
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    
    NSString *stringResult = [NSString stringWithFormat:@"%f", result];
    self.display.text = stringResult;

}

// Enter is pressed
- (IBAction)enterPressed:(id)sender {
    
    [self.calculatorBrain pushOperand:[self.display.text floatValue]];
    self.display.text = @"0";
    self.userIsEnteringNumber = NO;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
