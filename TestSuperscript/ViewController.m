//
//  ViewController.m
//  TestSuperscript
//
//  Created by Gautham S Shetty on 9/11/15.
//  Copyright (c) 2015 Gautham S Shetty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _lbl.attributedText = [self plainStringToAttributedUnits:@"54%"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
- (NSMutableAttributedString *)plainStringToAttributedUnits:(NSString *)string;
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    UIFont *font = [UIFont systemFontOfSize:38.0f];
    UIFont *smallFont = [UIFont systemFontOfSize:19.0f];
    
    [attString beginEditing];
    //[attString addAttribute:NSFontAttributeName value:(font) range:NSMakeRange(0, string.length - 2)];
    //[attString addAttribute:NSFontAttributeName value:(smallFont) range:NSMakeRange(string.length - 1, 1)];
    [attString addAttribute:(NSString*)kCTSuperscriptAttributeName value:@"2" range:NSMakeRange(string.length - 1, 1)];
    [attString addAttribute:NSFontAttributeName value:(smallFont) range:NSMakeRange(string.length - 1, 1)];
    [attString addAttribute:(NSString*)kCTForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length - 1)];
    [attString endEditing];
    return attString;
}

@end
