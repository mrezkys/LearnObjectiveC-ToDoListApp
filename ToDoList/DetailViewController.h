//
//  DetailViewController.h
//  ToDoList
//
//  Created by Muhammad Rezky on 01/08/25.
//

#import <UIKit/UIKit.h>
#import "TaskModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) TaskModel *task;


@end

NS_ASSUME_NONNULL_END
