//
//  RJStudent.m
//  Lesson35Ex
//
//  Created by Hopreeeeenjust on 30.01.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "RJStudent.h"

@implementation RJStudent

- (NSString *)description {
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
    return fullName;
}

@end
