//
//  TaskModel.h
//  ToDoList
//
//  Created by Muhammad Rezky on 31/07/25.
//

#import <Foundation/Foundation.h>

@interface TaskModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;

- (instancetype) initWithTitle:(NSString *)title subtitle:(NSString *) subtitle;
@end
