//
//  TrainingViewController.m
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingViewController.h"
#import "FirebaseService.h"
#import "TrainingCell.h"
#import "Training.h"

#import "TrainingTableViewController.h"
@interface TrainingViewController (){
    
    Training* currentTrainig;
    NSMutableArray *arr;
    NSDictionary *dict;
    QRCodeReaderViewController *vc;
    NSString *resultString;
}
@property (strong, nonatomic) NSMutableArray *trainings;
@property (strong, nonatomic) NSMutableArray *speaker;
@end

@implementation TrainingViewController
@synthesize trainingTable;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.date = [self dateForSelectedTab];
    self.navigationItem.title = [self dateTitleFromDate:self.date];
    
    _trainings = [[NSMutableArray alloc] init];
    _speaker = [[NSMutableArray alloc] init];


    [[FirebaseService sharedManager] getFirebase:(AMWTrainings) day: [NSString stringWithFormat:@"%lu",self.tabBarController.selectedIndex+1] speakerID: nil andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _trainings = result;
        [trainingTable reloadData];
    }];
    
    [[FirebaseService sharedManager] getFirebase:(AMWQuizzes) day:nil speakerID: nil andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        [_animationView startCanvasAnimation];
    }];
}

- (NSDate*) dateForSelectedTab {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:22 + self.tabBarController.selectedIndex];
    [comps setMonth:5];
    [comps setYear:2017];
    
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

- (NSString*) dateTitleFromDate:(NSDate*) date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM, EEEE"];
    NSString *weekDayText = [formatter stringFromDate:date];
    
    return weekDayText;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showQRComponents"]) {
        QRComponentsDetailsViewController* detailsVC = [segue destinationViewController];
        detailsVC.component = resultString;
    }
    if ([segue.identifier isEqualToString:@"segueToSpeaker"]) {
        SpeakerDeatails *sd = [segue destinationViewController];
        sd.training = currentTrainig;
        currentTrainig = nil;
    } else if ([segue.identifier isEqualToString:@"segueToTraining"]) {
        TrainingTableViewController *td = [segue destinationViewController];
        td.training = _trainings[self.trainingTable.indexPathForSelectedRow.row];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _trainings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TrainingCell *cell = [trainingTable dequeueReusableCellWithIdentifier:@"TrainingCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupContentWithTraining:_trainings[indexPath.row]];
    cell.delegate = self;
    return cell;
}


- (void) showSpeakerProfileForTraining:(Training *)training {
    currentTrainig = training;
    [self performSegueWithIdentifier:@"segueToSpeaker" sender:nil];
}

- (IBAction)OpenQR:(id)sender {
    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]]) {
        vc = nil;
        QRCodeReader *reader = [QRCodeReader readerWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
        vc = [QRCodeReaderViewController readerWithCancelButtonTitle:@"Cancel" codeReader:reader startScanningAtLoad:YES showSwitchCameraButton:YES showTorchButton:YES];
        vc.modalPresentationStyle = UIModalPresentationFormSheet;
        vc.delegate = self;
        [vc setCompletionWithBlock:^(NSString *resultAsString) {
            NSLog(@"Completion with result: %@", resultAsString);
        }];
        [self presentViewController:vc animated:YES completion:NULL];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Reader not supported by the current device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
}

- (void) reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result {
    NSLog(@"didScanResult");
    [reader stopScanning];
    [vc dismissViewControllerAnimated:YES completion:^{
        resultString = result;
        [self performSegueWithIdentifier:@"showQRComponents" sender:nil];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader {
    [vc dismissViewControllerAnimated:YES completion:NULL];
}
@end
