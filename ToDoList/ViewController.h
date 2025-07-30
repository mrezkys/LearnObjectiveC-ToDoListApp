//
//  ViewController.h
//  ToDoList
//
//  Created by Muhammad Rezky on 29/07/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *tasks;

@end

