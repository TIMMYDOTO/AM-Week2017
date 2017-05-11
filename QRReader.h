//
//  QRReader.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/11/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeReaderDelegate.h"
@interface QRReader : UIViewController <QRCodeReaderDelegate>
- (IBAction)scanAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@end
