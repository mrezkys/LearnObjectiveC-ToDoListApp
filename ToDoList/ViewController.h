//
//  ViewController.h
//  ToDoList
//
//  Created by Muhammad Rezky on 29/07/25.
//

#import <UIKit/UIKit.h>
#import "TaskModel.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray<TaskModel *> *tasks;

- (IBAction)didTapAdd:(id)sender;

@end

