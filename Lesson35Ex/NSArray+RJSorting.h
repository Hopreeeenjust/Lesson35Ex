//
//  NSArray+RJSorting.h
//  Lesson35Ex
//
//  Created by Hopreeeeenjust on 30.01.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RJSortingOptions) {
    RJSortingOptionsDate = 0,
    RJSortingOptionsName,
    RJSortingOptionsSurname,
};

@interface NSArray (RJSorting)

- (NSArray *)sortArrayWithOptions:(RJSortingOptions)options;

@end
