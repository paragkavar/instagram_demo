//
//  LoginViewController.h
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@interface LoginViewController : UIViewController

@property (strong, nonatomic) MasterViewController *masterViewController;

@property (retain, nonatomic) IBOutlet UITextField *loginTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)logIn:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
