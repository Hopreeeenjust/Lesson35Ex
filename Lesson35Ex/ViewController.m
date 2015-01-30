//
//  ViewController.m
//  Lesson35Ex
//
//  Created by Hopreeeeenjust on 30.01.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "ViewController.h"
#import "RJStudent.h"
#import "RJSection.h"
#import "NSArray+RJSorting.h"

@interface ViewController () <UITableViewDataSource>
@property (strong, nonatomic) NSArray *studentsArray;
@end

@implementation ViewController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *namesArray = @[@"Roma", @"Bill", @"Sam", @"Denis", @"Alex", @"Sergey", @"Anna", @"Liz", @"Helen", @"Bob", @"Rob", @"John", @"Katty", @"Simon", @"Nick", @"Piter", @"James", @"Kiran", @"Martin", @"Igor", @"Maks", @"Robby", @"Harry", @"Vova", @"Dima"];
    NSArray *surnamesArray = @[@"Gibbs", @"Smith", @"Beniakovski", @"Long", @"Potter", @"Bond", @"Russel", @"Ostin", @"Mendez", @"Green", @"Bullock", @"Jones", @"Freeman", @"Murphy", @"Hanks", @"Goldberg", @"Williams", @"Depp", @"Hoffman", @"Martin", @"Law", @"Oldman", @"Carter", @"Hopkins", @"Delon"];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < arc4random_uniform(31) + 30; i++) {
        RJStudent *student = [RJStudent new];
        student.firstName = [namesArray objectAtIndex:(int)(arc4random_uniform((int)[namesArray count] * 1000) / 1000)];
        student.lastName = [surnamesArray objectAtIndex:(int)(arc4random_uniform((int)[surnamesArray count] * 1000) / 1000)];
        NSInteger age = arc4random_uniform(8 * 31556926) + 17 * 31556926;
        student.birthDate = [NSDate dateWithTimeIntervalSinceNow:-age];
        [tempArray addObject:student];
    }
    self.studentsArray = [tempArray sortArrayWithOptions:RJSortingOptionsDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.studentsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Student";
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    RJStudent *student = [self.studentsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:student.birthDate]];
    return cell;
}

#pragma mark - Help methods

- (NSArray *)generateSectionsFromArray:(NSArray *)array {
    return array;
}

@end
