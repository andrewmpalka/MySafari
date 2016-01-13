//
//  ViewController.m
//  MySafari
//
//  Created by Andrew Palka on 1/12/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)urlTextField {
    if ([urlTextField.text containsString:@"http://wwww."] == YES)  {
        urlTextField.text = urlTextField.text;
    } else if ([urlTextField.text containsString:@"https://wwww."] == YES) {
        urlTextField.text = urlTextField.text;
    } else if ([urlTextField.text containsString:@"wwww."] == YES) {
        urlTextField.text = [NSString stringWithFormat:@"http://%@", urlTextField.text];
    } else {
        urlTextField.text = [NSString stringWithFormat:@"http://www.%@", urlTextField.text];
    }
    
    NSURL *url = [NSURL URLWithString:urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    return true;
}
- (IBAction)onComingSoonPressed:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Coming Soon!" message: @"3D Odors" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cool = [UIAlertAction actionWithTitle:@"Cool!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    [self presentViewController:alertController animated:YES completion:^{
        nil;
    }];
    [alertController addAction:cool];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
   // self.spinner.hidesWhenStopped = YES;
//disables backbutton if you cannot go back
    if ([self.webView canGoBack]) {
        [self.backButton setEnabled:YES];
    } else {
        [self.backButton setEnabled:NO];
    }
//disables forward button if you cannot go forward
    if ([self.webView canGoForward]) {
        [self.forwardButton setEnabled:YES];
    } else {
        [self.forwardButton setEnabled:NO];
    }
    
}
- (IBAction)onBackButtonPressed:(UIButton *)sender {
    [self.webView goBack];
}
- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    [self.webView goForward];
}
- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    [self.webView stopLoading];
    
}
- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.webView reload];
}

@end
