//
//  TrainingViewController.h
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpeakerDeatails.h"
#import "TrainingCell.h"
#import <Canvas/Canvas.h>
#import "QRCodeReader.h"
#import "QRCodeReaderViewController.h"
#import "QRComponentsDetailsViewController.h"
#import <FirebaseDatabase/FirebaseDatabase.h>

@interface TrainingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, TrainingCellDelegate, QRCodeReaderDelegate>

@property (nonatomic,retain) NSDate* date;
@property (nonatomic, weak) IBOutlet UITableView *trainingTable;

- (IBAction)OpenQR:(id)sender;

@end
