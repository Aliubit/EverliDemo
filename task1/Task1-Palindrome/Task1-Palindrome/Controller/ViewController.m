//
//  ViewController.m
//  Task1-Palindrome
//
//  Created by Apple on 11/02/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Palindrome";
    [self.textField setDelegate:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *newString = [self.textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([newString length] > 0) {
        if ([newString isPalindrome]) {
            self.outputLabel.textColor = [UIColor greenColor];
            [self.outputLabel setText:@"Above string is a palindrome"];
        }
        else {
            self.outputLabel.textColor = [UIColor redColor];
            [self.outputLabel setText:@"Above string is not a palindrome"];
        }
        [self.outputLabel setHidden:false];
    }
    else {
        [self.outputLabel setHidden:YES];
    }
    
    return YES;
}


@end
