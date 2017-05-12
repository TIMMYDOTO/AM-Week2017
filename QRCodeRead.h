//
//  QRCodeRead.h
//  AM Week
//
//  Created by Artiom Schiopu on 5/12/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QRCodeReaderDelegate.h"
#import "TrainingViewController.h"

@interface QRCodeRead : NSObject <QRCodeReaderDelegate>

-(void)scanAction;
@end
