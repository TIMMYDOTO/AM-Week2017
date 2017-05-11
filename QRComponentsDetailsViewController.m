//
//  QRComponentsDetailsViewController.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/11/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QRComponentsDetailsViewController.h"

@interface QRComponentsDetailsViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation QRComponentsDetailsViewController


- (void)viewDidLoad {
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.component]]];
}


@end
