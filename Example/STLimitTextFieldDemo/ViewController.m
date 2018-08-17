//
//  ViewController.m
//  STLimitTextFieldDemo
//
//  Created by Suta on 2017/5/16.
//  Copyright © 2017年 Suta. All rights reserved.
//

#import "ViewController.h"
#import <STLimitTextField/STLimitTextField.h>

@interface ViewController ()

@end

@implementation ViewController {
    __weak IBOutlet STLimitTextField *_txtMain;
    __weak IBOutlet UILabel *_lblLimit;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_txtMain becomeFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - Event

- (IBAction)limitStepperValueChanged:(UIStepper *)sender {
    NSInteger value = (NSInteger)sender.value;
    value = MAX(0, value);
    _lblLimit.text = [NSString stringWithFormat:@"%ld", (long)value];
    _txtMain.limit = (NSUInteger)value;
}

- (IBAction)limitTypeSegmentedControlValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _txtMain.limitType = STLimitLength;
    } else if (sender.selectedSegmentIndex == 1) {
        _txtMain.limitType = STLimitChar;
    }
}

@end
