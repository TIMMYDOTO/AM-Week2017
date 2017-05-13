//
//  SpeakerDeatails.m
//  AM Week
//
//  Created by Artiom Schiopu on 5/4/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "SpeakerDeatails.h"

@interface SpeakerDeatails ()
@end

@implementation SpeakerDeatails

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_speakerTableViewCell setupContentWithSpeaker: _details];
    [_aboutSpeakerTableViewCell setupContentWithAboutSpeaker: _details];
    
//    [[FirebaseService sharedManager] getFirebase:(AMWTrainings) day: [NSString stringWithFormat:@"%lu",self.tabBarController.selectedIndex+1] speakerID: nil andCompletionBlock:^(NSMutableArray *result, NSError *error) {
//        _trainings = result;
//        [trainingTable reloadData];
//    }];
    
//    [self setupSpeakerDetails];
  //  NSLog(@"speakerURL: %@",self.speakerURL);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)setupSpeakerDetails{
//    _speakerName.text = _details.speaker;
//    _speakerDetails.text = _details.shortInfo;
//    
//    [_speakerImage sd_setImageWithURL:[NSURL URLWithString:_details.speakerImage]];
//    self.speakerImage.layer.cornerRadius = self.speakerImage.frame.size.height/2;
//    self.speakerImage.layer.masksToBounds = YES;
// 
//    
//    _about.text = _details.longInfo;
//  
//    _trainingTitle.text = _details.title;
//    _trainingStream.text = _details.stream;
//    _trainingTime.text = _details.time;
//    _date.text = _details.date;
//}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 3;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return 1;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if(indexPath.section < [super numberOfSectionsInTableView:tableView]) {
//        return [super tableView: tableView cellForRowAtIndexPath: indexPath];
//    }
//    else {
//        // do your own dynamic cell management;
//    }
//    return nil;
//}


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
