//
//  QuizViewController.m
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import "QuizViewController.h"
#import "FirebaseService.h"
#import "QuizCell.h"
#import "Quiz.h"

@import FirebaseDatabase;
@import GoogleSignIn;
@import Firebase;

@interface QuizViewController ()

@property (strong, nonatomic) UIButton *userButton;
@property (strong, nonatomic) UIImage *buttonImage;
@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) NSMutableArray *quizzes;
@property(nonatomic, weak) IBOutlet UITableView *quizTable;

@end

@implementation QuizViewController
@synthesize quizTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.transform = CGAffineTransformMakeScale(1.3, 1.3);
    CGRect frame = spinner.frame;
    
    
    frame.origin.x = (self.view.frame.size.width / 2 - frame.size.width / 2);
    frame.origin.y = (self.view.frame.size.height / 2 - frame.size.height / 2);
    spinner.frame = frame;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    _quizzes = [[NSMutableArray alloc] init];
    
    _userButton = [[UIButton alloc] init];
    _buttonImage = [[UIImage alloc] init];
    
    _image = [[UIImageView alloc] init];
    
    [[FirebaseService sharedManager] getFirebase:(AMWQuizzes) day:nil speakerID: nil andCompletionBlock:^(NSMutableArray *result, NSError *error) {
        _quizzes = result;
        [spinner stopAnimating];
        [quizTable reloadData];

    }];
}

- (void) viewWillAppear:(BOOL)animated{
    if ([GIDSignIn sharedInstance].currentUser) {
        [self signIn:[GIDSignIn sharedInstance] didSignInForUser:[GIDSignIn sharedInstance].currentUser withError:nil];
    }else{
        [self setupUserButton:nil];
    }
}

- (void)signIn: (GIDSignIn *) signIn didSignInForUser: (GIDGoogleUser *) user withError: (NSError *) error {
    if ([GIDSignIn sharedInstance].currentUser) {
        if ([GIDSignIn sharedInstance].currentUser.profile.hasImage) {
            NSURL *imageURL = [user.profile imageURLWithDimension:100];

            [_image sd_setImageWithURL:imageURL];
            
            [self setupUserButton: _image.image];
        }
    }else{
            [self setupUserButton:nil];
    }
}

- (void) setupUserButton: (UIImage*) userPicture {
    
    if(userPicture == nil){
        _buttonImage = [UIImage imageNamed:@"Image Placeholder"];
    }else{
        _buttonImage = userPicture;
    }
    
    _userButton.frame = CGRectMake(0,0,30,30);
    _userButton.layer.cornerRadius = _userButton.frame.size.height/2;
    _userButton.layer.masksToBounds = YES;
    [_userButton setBackgroundImage:_buttonImage forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_userButton];
    [_userButton addTarget:self action:@selector(pushToGoogle) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushToGoogle {
    [self performSegueWithIdentifier:@"login" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _quizzes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QuizCell *cell = [quizTable dequeueReusableCellWithIdentifier:@"QuizCell" forIndexPath:indexPath];
    [cell setupContentWithQuiz:_quizzes[indexPath.row]];
    
    return cell;
}

@end
