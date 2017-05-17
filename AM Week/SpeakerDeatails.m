//
//  SpeakerDeatails.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "SpeakerDeatails.h"
#import "ENMBadgedBarButtonItem.h"

@interface SpeakerDeatails (){
    NSDictionary *dict;
    FIRDatabaseHandle refHandle;
}

@property (nonatomic, strong) ENMBadgedBarButtonItem *navButton;
@end

@implementation SpeakerDeatails

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SpeakerDeatails");
    
    refHandle = [[[[FIRDatabase database] reference] child:@"quizzes"]  observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        dict = snapshot.value;
        self.navButton.badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)dict.count];
    }];
    
    [self setupSpeakerDetails];
    [self setupQuizButton];
}

- (void) setupQuizButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Quizzes" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.frame = CGRectMake(0, 0, 67, 30);
    [button addTarget:self action:@selector(showQuzzies) forControlEvents:UIControlEventTouchDown];
    
    self.navButton = [[ENMBadgedBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = self.navButton;
}

-(void)showQuzzies {
    [self performSegueWithIdentifier:@"segueToQuizzes" sender:nil];
}

#pragma mark - Table view data source
-(void)setupSpeakerDetails{
    _speakerName.text = _details.speaker;
    _speakerDetails.text = _details.shortInfo;
    
    [_speakerImage sd_setImageWithURL:[NSURL URLWithString:_details.speakerImage]];
    self.speakerImage.layer.cornerRadius = self.speakerImage.frame.size.height/2;
    self.speakerImage.layer.masksToBounds = YES;
 
    
    _about.text = _details.longInfo;
  
    _trainingTitle.text = _details.title;
    _trainingStream.text = _details.stream;
    _trainingTime.text = _details.time;
    _date.text = _details.date;
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
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
