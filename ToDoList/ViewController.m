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
    // Do any additional setup after loading the view.
}

- (IBAction)didTapButton:(id)sender {
    UIAlertController *alert = [
        UIAlertController
        alertControllerWithTitle:@"Success"
        message: @" Success change the label name!"
        preferredStyle:UIAlertControllerStyleAlert
    ];
    
    UIAlertAction *ok = [
        UIAlertAction actionWithTitle:@"Ok"
        style:UIAlertActionStyleDefault
        handler:nil
    ];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    self.helloLabel.text = @"You Tapped the Button!";

}

@end
