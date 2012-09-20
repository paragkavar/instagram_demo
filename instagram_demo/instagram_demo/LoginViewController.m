//
//  LoginViewController.m
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import "LoginViewController.h"
#import "MasterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginTextField;
@synthesize passwordTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            self.title = @"Instagram";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Log out"
                                                            style:UIBarButtonItemStylePlain
                                                            target: nil
                                                            action:nil];
    self.navigationItem.backBarButtonItem =logoutButton;
    [logoutButton release];
}

- (void)viewDidUnload
{
    [self setLoginTextField:nil];
    [self setPasswordTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)logIn:(id)sender {
    NSString *login = loginTextField.text;
    NSString *password = passwordTextField.text;
    
    [loginTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
    BOOL loggedIn = NO; //[instaInteractor connect];
    
    if(loggedIn)
    {
        if (!self.masterViewController) {
            self.masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
        }
        [self.navigationController pushViewController:self.masterViewController animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Autentifcation failed"
                                                        message:@"Try again."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];    }
}

- (IBAction)dismissKeyboard:(id)sender {
    [loginTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

- (void)dealloc {
    [loginTextField release];
    [passwordTextField release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end
