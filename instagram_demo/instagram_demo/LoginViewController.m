//
//  LoginViewController.m
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import "LoginViewController.h"
#import "MasterViewController.h"
#import "InstaInteractor.h"

@interface LoginViewController ()

@end

//static NSString *const clientID = @"bd4a5d199d1840a8b17054fab5835000";
//static NSString *const clientSecret = @"bd4a5d199d1840a8b17054fab5835000";


@implementation LoginViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            self.title = @"Instagram Demo";
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
    

    NSString *logoutAddress = @"https://instagram.com/accounts/logout";
        
    NSURL *url = [NSURL URLWithString:logoutAddress];
        
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
    [webView loadRequest:requestObj];
    [webView setScalesPageToFit:YES];
    
    NSString *urlAddress2 = @"https://api.instagram.com/oauth/authorize/?client_id=bd4a5d199d1840a8b17054fab5835000&redirect_uri=http://habrahabr.ru/NeverGonnaFindMe&scope=likes&response_type=token&display=touch";
    
    NSURL *url2 = [NSURL URLWithString:urlAddress2];
    
    NSURLRequest *requestObj2 = [NSURLRequest requestWithURL:url2];
    
    [self.webView loadRequest:requestObj2];
    [self.webView setScalesPageToFit:YES];}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *Url = [request URL];
    NSArray *UrlParts = [Url pathComponents];
    if ([[UrlParts objectAtIndex:(1)] isEqualToString:@"NeverGonnaFindMe"]) {

        NSString *urlResources = [Url resourceSpecifier];
        urlResources = [urlResources stringByReplacingOccurrencesOfString:@"?" withString:@""];
        urlResources = [urlResources stringByReplacingOccurrencesOfString:@"#" withString:@""];
        
        NSArray *urlResourcesArray = [urlResources componentsSeparatedByString:@"/"];

        NSString *urlParamaters = [urlResourcesArray objectAtIndex:([urlResourcesArray count]-1)];

        NSArray *urlParamatersArray = [urlParamaters componentsSeparatedByString:@"&"];
        
        if([urlParamatersArray count] == 1) {
            NSString *keyValue = [urlParamatersArray objectAtIndex:(0)];
            NSArray *keyValueArray = [keyValue componentsSeparatedByString:@"="];
            
            if([[keyValueArray objectAtIndex:(0)]
                
                isEqualToString:@"NeverGonnaFindMeaccess_token"]) {
                
                [InstaInteractor setToken:[keyValueArray objectAtIndex:(1)]];
                
                if (!self.masterViewController) {
                    self.masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
                }
                [self.navigationController pushViewController:self.masterViewController animated:YES];
            }
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Autentifcation failed"
                                                            message:@"Try again."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
        [self dismissModalViewControllerAnimated:YES];
        return NO;
    }
    else{
        
        return YES;
    }
}

@end	