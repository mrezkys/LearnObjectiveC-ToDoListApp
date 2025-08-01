//
//  TaskModel.m
//  ToDoList
//
//  Created by Muhammad Rezky on 31/07/25.
//

#import <Foundation/Foundation.h>
#import "TaskModel.h"

@implementation TaskModel

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.subtitle = subtitle;
    }
    
    return self;
    
}

@end
