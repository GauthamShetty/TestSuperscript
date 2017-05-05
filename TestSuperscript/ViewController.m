//
//  ViewController.m
//  TestSuperscript
//
//  Created by Gautham S Shetty on 9/11/15.
//  Copyright (c) 2015 Gautham S Shetty. All rights reserved.
//

#import "ViewController.h"

typedef enum
{
    eSubScript = -1,
    eNormalScript = 0,
    eSuperScript = 1
}ECustomScript;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
- (NSMutableAttributedString *)superScriptFromString:(NSString *)string customScript:(ECustomScript)inValue;
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    UIFont *font = [UIFont systemFontOfSize:38.0f];
    UIFont *smallFont = [UIFont systemFontOfSize:19.0f];
    
    [attString beginEditing];
    //[attString addAttribute:NSFontAttributeName value:(font) range:NSMakeRange(0, string.length - 2)];
    //[attString addAttribute:NSFontAttributeName value:(smallFont) range:NSMakeRange(string.length - 1, 1)];
    [attString addAttribute:(NSString*)kCTSuperscriptAttributeName value:[NSNumber numberWithInteger:inValue] range:NSMakeRange(string.length - 1, 1)];
    [attString addAttribute:NSFontAttributeName value:(smallFont) range:NSMakeRange(string.length - 1, 1)];
    [attString addAttribute:(NSString*)kCTForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length - 1)];
    [attString endEditing];
    return attString;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *str = [_txtValue text];
    _lblSuperScript.attributedText = [self superScriptFromString:str customScript:eSuperScript];
    _lblSubScript.attributedText = [self superScriptFromString:str customScript:eSubScript];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
