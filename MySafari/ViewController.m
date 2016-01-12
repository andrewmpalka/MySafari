//
//  ViewController.m
//  MySafari
//
//  Created by Andrew Palka on 1/12/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)urlTextField {
    NSURL *url = [NSURL URLWithString:urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView ]
    return true;

}

@end
