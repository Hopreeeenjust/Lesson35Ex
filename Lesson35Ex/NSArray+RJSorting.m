//
//  NSArray+RJSorting.m
//  Lesson35Ex
//
//  Created by Hopreeeeenjust on 30.01.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "NSArray+RJSorting.h"
#import "RJStudent.h"

@implementation NSArray (RJSorting)

- (NSArray *)sortArrayWithOptions:(RJSortingOptions)options {
    NSArray *descriptorsArray = [NSArray new];

    NSSortDescriptor *dateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES comparator:^NSComparisonResult(RJStudent *obj1, RJStudent *obj2) {
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"MM"];
        return [[formatter stringFromDate:obj1.birthDate] compare:[formatter stringFromDate:obj2.birthDate]];
    }];
    NSSortDescriptor *nameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES comparator:^NSComparisonResult(RJStudent *obj1, RJStudent *obj2) {
        return [obj1.firstName compare:obj2.firstName];
    }];
    NSSortDescriptor *surnameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES comparator:^NSComparisonResult(RJStudent *obj1, RJStudent *obj2) {
        return [obj1.lastName compare:obj2.lastName];
    }];
    
    if (options == RJSortingOptionsDate) {
        descriptorsArray = @[dateDescriptor, nameDescriptor, surnameDescriptor];
    } else if (options == RJSortingOptionsName) {
        descriptorsArray = @[nameDescriptor, surnameDescriptor, dateDescriptor];
    } else {
        descriptorsArray = @[surnameDescriptor, dateDescriptor, nameDescriptor];
    }
    NSArray *sortedArray = [self sortedArrayUsingDescriptors:descriptorsArray];
    
    return sortedArray;
}

@end
