//
//  TrainingViewController.m
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingViewController.h"

@interface TrainingViewController ()

@property(nonatomic, weak) IBOutlet UITableView *trainingTable;
@end

@implementation TrainingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.date = [self dateForSelectedTab];
    self.navigationItem.title = [self dateTitleFromDate:self.date];
    
}

- (NSDate*) dateForSelectedTab {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:22 + self.tabBarController.selectedIndex];
    [comps setMonth:5];
    [comps setYear:2017];
    
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

-(NSString*) dateTitleFromDate:(NSDate*) date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM, EEEE"];
    NSString *weekDayText = [formatter stringFromDate:date];
    
    return weekDayText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
