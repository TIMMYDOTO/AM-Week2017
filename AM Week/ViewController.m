//
//  ViewController.m
//  AM Week
//
//  Created by Artiom Schiopu on 4/18/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "ViewController.h"
#import "FireBaseService.h"
@import FirebaseDatabase;

@interface ViewController (){
    NSMutableArray * dataSource;
    FIRDatabaseHandle refHandle;
    FIRDatabaseReference *ref;
    NSDictionary *dict;
}

@property (nonatomic,strong) NSDate* currentDate;
@property (nonatomic,weak) UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _currentDate = [NSDate date];
//    dataSource = [[NSMutableArray alloc] init];
//
//    NSMutableArray* array = [FireBaseService getAllTrainings];
//    NSLog(@"%@", array);
    [self reloadData];
//    
//    dict = [[NSDictionary alloc] init];
//    [[ref child:@"users"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//        // Get user value
//        dict = snapshot.value;
//        
//        // ...
//    } withCancelBlock:^(NSError * _Nonnull error) {
//        NSLog(@"%@", error.localizedDescription);
//    }];
//    NSLog(@"ceva: %@", dict);
    
}

- (void) reloadData {
    [[FireBaseService sharedManager] getScheduleForDate:_currentDate completionBlock:^(NSArray *result, NSError *error) {
        dataSource = nil;
        dataSource = [NSMutableArray arrayWithArray:result];
        NSLog(@"%@", dataSource);
        if (error) {
            // alert
        } else {
            dataSource = nil;
            dataSource = [NSMutableArray arrayWithArray:result];
            NSLog(@"%@", dataSource);
            [_tableView reloadData];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
