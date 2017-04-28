//
//  ScheduleTableViewController.m
//  AM Week
//
//  Created by Artiom Schiopu on 4/19/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "ScheduleTableViewController.h"

@interface ScheduleTableViewController ()

@end

@implementation ScheduleTableViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.date = [self dateForSelectedTab];
    self.navigationItem.title = [self dateTitleFromDate:self.date];
    
    UIButton *button = [[UIButton alloc] init];
    UIImage*image = [UIImage imageNamed:@"person"];
    button.frame = CGRectMake(0,0,30,30);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
 [button addTarget:self action:@selector(pushToGoogle) forControlEvents:UIControlEventTouchUpInside];
        
    
}
-(void)pushToGoogle
{
    [self performSegueWithIdentifier:@"segueIdentifier" sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
