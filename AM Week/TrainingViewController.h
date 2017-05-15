//
//  TrainingViewController.h
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import "SpeakerDeatails.h"
#import "TrainingCell.h"
#import <Canvas/Canvas.h>
#import "QRCodeReader.h"
#import "QRCodeReaderViewController.h"
#import "QRComponentsDetailsViewController.h"

@interface TrainingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, TrainingCellDelegate, QRCodeReaderDelegate>
@property (weak, nonatomic) IBOutlet CSAnimationView *animationView;

@property (nonatomic,retain) NSDate* date;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property(nonatomic, weak) IBOutlet UITableView *trainingTable;

- (IBAction)OpenQR:(id)sender;

@end
