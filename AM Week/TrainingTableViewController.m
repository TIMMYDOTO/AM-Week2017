//
//  TrainingTableViewController.m
//  AM Week
//
//  Created by Ion Verdes on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingTableViewController.h"
#import "FirebaseService.h"
@interface TrainingTableViewController ()
@property (strong, nonatomic) NSMutableArray *trainings;
@end


@implementation TrainingTableViewController
@synthesize description, tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
      _trainings = [[NSMutableArray alloc] init];
    [[FirebaseService sharedManager] getFirebase:(AMWTrainings) andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        
        _trainings = result;
        
        [tableView reloadData];
    }];
    [self setupSpeaker];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) setupSpeaker {

   NSLog(@"_training.speakerImage %@", _training.speakerImage);
   [self.speakerImage sd_setImageWithURL:[NSURL URLWithString:_training.speakerImage] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"person"]];
    self.speakerImage.layer.cornerRadius = self.speakerImage.frame.size.height/2;
    self.speakerImage.layer.masksToBounds = YES;
    self.speakerImage.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _speakerName.text = _training.speaker;
    _date.text = _training.date;
    _location.text = _training.location;
    _language.text = _training.language;
    _time.text = _training.time;
    _type.text = _training.type;
    description.text = _training.description;
    _stream.text = _training.stream;

    }
#pragma mark - Table view data source
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueToSpeaker"]) {
        SpeakerDeatails *sd = [segue destinationViewController];
       sd.details = _trainings[self.tableView.indexPathForSelectedRow.row];
        
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
