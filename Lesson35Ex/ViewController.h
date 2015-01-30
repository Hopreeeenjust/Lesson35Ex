//
//  ViewController.h
//  Lesson35Ex
//
//  Created by Hopreeeeenjust on 30.01.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *searchControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)searchControlValueChanged:(UISegmentedControl *)searchControl;
@end

