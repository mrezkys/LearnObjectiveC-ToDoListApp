//
//  ViewController.m
//  ToDoList
//
//  Created by Muhammad Rezky on 29/07/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tasks = [NSMutableArray arrayWithArray:@[
        [[TaskModel alloc] initWithTitle:@"Buy groceries" subtitle:@"Today"],
        [[TaskModel alloc] initWithTitle:@"Read a book" subtitle:@"Chapter 2"],
        [[TaskModel alloc] initWithTitle:@"Walk the dog" subtitle:@"Before dinner"]
    ]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;

}

- (IBAction)didTapAdd:(id)sender {
    [self.tasks addObject:[[TaskModel alloc] initWithTitle:@"New Data" subtitle:@"New Data"]];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }

    cell.textLabel.text = self.tasks[indexPath.row].title;
    cell.detailTextLabel.text = self.tasks[indexPath.row].subtitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
