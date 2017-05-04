//
//  TrainingViewController.h
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
@interface TrainingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,retain) NSDate* date;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end
