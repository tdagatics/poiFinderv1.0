//
//  TableViewController.h
//  poiFinderv1.0
//
//  Created by Anthony Dagati on 11/23/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"

@interface TableViewController : UIViewController <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
- (IBAction)searchButtonPressed:(id)sender;
@property (strong, nonatomic) NSDictionary *dictionaryForTableView;


@end
