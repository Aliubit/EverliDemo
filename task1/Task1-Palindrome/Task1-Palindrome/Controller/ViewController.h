//
//  ViewController.h
//  Task1-Palindrome
//
//  Created by Apple on 11/02/2021.
//

#import <UIKit/UIKit.h>
#import "NSString+String_Palindrome.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UILabel *outputLabel;

@end

