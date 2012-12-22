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

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsEnteringNumber = _userIsEnteringNumber;
@synthesize calculatorBrain = _calculatorBrain;


-(Brain *)calculatorBrain{
    if (!_calculatorBrain) _calculatorBrain = [[Brain alloc] init];
    return _calculatorBrain;
}

// Digit is pressed.
- (IBAction)digitPressed:(UIButton *)sender {
    // Gets the button title from the button that SENT the digitPressed action.

    NSLog(@"The Button Pressed is: %@", sender.currentTitle);
    
    // Gets the current display text.
    
    if (self.userIsEnteringNumber){
        self.display.text = [self.display.text stringByAppendingString:sender.currentTitle];
    }
    else {
        self.display.text = sender.currentTitle;
        self.userIsEnteringNumber = YES;
    }

}

// CLR is pressed
- (IBAction)clearPressed:(id)sender {
    self.display.text = @"0";
    self.userIsEnteringNumber = NO;
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
    if ([sender.currentTitle isEqualToString:@"X"]){
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    if ([sender.currentTitle isEqualToString:@"-"]){
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    if ([sender.currentTitle isEqualToString:@"/"]){
        result = [self.calculatorBrain performOperation:sender.currentTitle];
    }
    
    NSString *stringResult = [NSString stringWithFormat:@"%f", result   ];
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
