//
//  TrainingViewController.m
//  AM Week
//
//  Created by Ion Verdes on 4/29/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "TrainingViewController.h"
#import "FirebaseService.h"

#import "Training.h"
#import "TrainingTableViewController.h"
@interface TrainingViewController (){
    
    Training* currentTrainig;
    NSMutableArray *arr;
    FIRDatabaseHandle refHandle;
    NSDictionary *dict;
  
}


@property (strong, nonatomic) NSMutableArray *trainings;

@end

@implementation TrainingViewController
@synthesize trainingTable;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
 
   
    self.ref = [[FIRDatabase database] reference];
    refHandle = [[_ref child:@"quizzes"]  observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        dict = snapshot.value;

//        _question.text = [[dict objectForKey:@"androiodone"] objectForKey: @"question"];
//        _labelForCode.text = [[dict objectForKey:@"androiodone"] objectForKey:@"codeSnippet"];
    
    }];

    
    
    self.date = [self dateForSelectedTab];
    self.navigationItem.title = [self dateTitleFromDate:self.date];

    _trainings = [[NSMutableArray alloc] init];
    
    UIButton *button = [[UIButton alloc] init];
    UIImage *image = [UIImage imageNamed:@"Image Placeholder"];
    button.frame = CGRectMake(0,0,30,30);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(pushToGoogle) forControlEvents:UIControlEventTouchUpInside];
    

    [[FirebaseService sharedManager] getFirebase:(AMWTrainings) day: [NSString stringWithFormat:@"%lu",self.tabBarController.selectedIndex+1] andCompletionBlock:^(NSMutableArray *result, NSError *error) {

        _trainings = result;
    
        [trainingTable reloadData];
    }];
    
    
    [[FirebaseService sharedManager] getFirebase:(AMWQuizzes) day:nil  andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        
        [_animationView startCanvasAnimation];
    }];
}


-(void)pushToGoogle
{
    [self performSegueWithIdentifier:@"toGoogle" sender:self];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueToSpeaker"]) {
        SpeakerDeatails *sd = [segue destinationViewController];
    
        sd.details = currentTrainig;
        currentTrainig = nil;
        
    }
    if ([segue.identifier isEqualToString:@"segueToTraining"]) {
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

-(void)showSpeakerProfileForTraining:(Training *)training {
    currentTrainig = training;
    [self performSegueWithIdentifier:@"segueToSpeaker" sender:nil];
    
}


@end
