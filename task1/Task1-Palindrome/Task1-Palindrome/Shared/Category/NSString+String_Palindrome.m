//
//  NSString+String_Palindrome.m
//  Task1-Palindrome
//
//  Created by Apple on 11/02/2021.
//

#import "NSString+String_Palindrome.h"

@implementation NSString (String_Palindrome)
-(BOOL) isPalindrome {
    
    NSString *sSelf = [self lowercaseString];
    NSUInteger len = [sSelf length];
    unichar buffer[len+1];
    [sSelf getCharacters:buffer range:NSMakeRange(0, len)];
    BOOL isPalindrome = YES;
    
    for(int i = 0; i < len/2 ; i++) {
      NSLog(@"%C", buffer[i]);
        if (buffer[i] != buffer[len-i-1]) {
            isPalindrome = false;
            break;
        }
    }
    
    return isPalindrome;
    
}
@end
