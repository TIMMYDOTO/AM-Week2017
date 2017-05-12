//
//  QRCodeRead.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/12/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QRCodeRead.h"
#import "QRCodeReader.h"
#import "QRCodeReaderViewController.h"

@implementation QRCodeRead{
    TrainingViewController *tvc;
    NSString* resultString;
    UIViewController *top;

}
-(void)scanAction{

    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]]) {
        static QRCodeReaderViewController *vc = nil;
        static dispatch_once_t onceToken;
     
        top = [UIApplication sharedApplication].keyWindow.rootViewController;
        dispatch_once(&onceToken, ^{
            QRCodeReader *reader = [QRCodeReader readerWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
            vc                   = [QRCodeReaderViewController readerWithCancelButtonTitle:@"Cancel" codeReader:reader startScanningAtLoad:YES showSwitchCameraButton:YES showTorchButton:YES];
            vc.modalPresentationStyle = UIModalPresentationFormSheet;
        });
        vc.delegate = self;
      
        
        [vc setCompletionWithBlock:^(NSString *resultAsString) {
            NSLog(@"Completion with result: %@", resultAsString);
        }];

        [top presentViewController:vc animated:YES completion:NULL];
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Reader not supported by the current device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }


}
- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    NSLog(@"didScanResult");
    [reader stopScanning];
    
    [top dismissViewControllerAnimated:YES completion:^{
        
        resultString = result;
    [top performSegueWithIdentifier:@"showQRComponents" sender:nil];
        
        
        //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        // [alert show];
        
        
        return;
    }];
}
- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
     NSLog(@"readerDidCancel");
    [top dismissViewControllerAnimated:YES completion:NULL];
}
@end
