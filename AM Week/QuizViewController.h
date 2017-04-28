//
//  QuizViewController.h
//  AM Week
//
//  Created by Ion Verdes on 4/27/17.
//  Copyright © 2017 Artiom Schiopu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *quizTable;

}

@end
