//
//  ViewController.m
//  ToDoList
//
//  Created by Muhammad Rezky on 29/07/25.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import <objc/runtime.h>


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
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Task" message:@"Enter title and note" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textfield) {
        textfield.placeholder = @"Title";
        [textfield addTarget:self
                      action:@selector(alertTextChanged:)
            forControlEvents:UIControlEventEditingChanged];

    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textfield) {
        textfield.placeholder = @"Note";
    }];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *title = alert.textFields[0].text;
        NSString *note = alert.textFields[1].text;
        
        if (title.length == 0) title = @"Untitled";
        if (note.length == 0) note = @"(No note)";
        
        TaskModel *task = [[TaskModel alloc] initWithTitle:title subtitle:note];
        [self.tasks addObject:task];
        [self.tableView reloadData];
    }];
    
    action.enabled = false;
    
    [alert addAction:action];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    objc_setAssociatedObject(alert, @"saveAction", action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self presentViewController:alert animated:true completion:nil];
}

- (void)alertTextChanged:(UITextField *) textField {
    UIAlertController *alert = (UIAlertController *)self.presentedViewController;
    UIAlertAction *saveAction = objc_getAssociatedObject(alert, @"saveAction");

    NSString *title = textField.text;
    saveAction.enabled = title.length > 0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TaskModel *task = self.tasks[indexPath.row];
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        detailVC.task = task;
    }
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
