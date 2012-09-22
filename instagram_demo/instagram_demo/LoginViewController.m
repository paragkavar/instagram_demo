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

//static NSString *const tokenUrlString = @" https://api.instagram.com/oauth/access_token/ ";

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
    
 //   NSString *urlAddress = @"http://www.google.com";
    NSString *urlAddress2 = @"https://api.instagram.com/oauth/authorize/?client_id=bd4a5d199d1840a8b17054fab5835000&redirect_uri=http://habrahabr.ru/NeverGonnaFindMe&scope=likes&response_type=token&display=touch";    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress2];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    [webView setScalesPageToFit:YES];
}

//- (void)viewDidLoad {
//[super viewDidLoad];
//    // Do any additional setup after loading the view.
//    NSString *fullAuthUrlString = [[NSString alloc]
//                                   initWithFormat:@"%@/?client_id=%@&redirect_uri=%@&scope=%@&response_type=token&display=touch",
//                                   authUrlString,
//                                   clientID,
//                                   redirectUri,
//                                   scope
//                                   ];
//    NSURL *authUrl = [NSURL URLWithString:fullAuthUrlString];
//    NSURLRequest *myRequest = [[NSURLRequest alloc] initWithURL:authUrl];
//    [webView loadRequest:myRequest];
//}


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
        // CONVERT TO STRING AN CLEAN
        NSString *urlResources = [Url resourceSpecifier];
        urlResources = [urlResources stringByReplacingOccurrencesOfString:@"?" withString:@""];
        urlResources = [urlResources stringByReplacingOccurrencesOfString:@"#" withString:@""];
        
        // SEPORATE OUT THE URL ON THE /
        NSArray *urlResourcesArray = [urlResources componentsSeparatedByString:@"/"];
        // THE LAST OBJECT IN THE ARRAY
        NSString *urlParamaters = [urlResourcesArray objectAtIndex:([urlResourcesArray count]-1)];
        // SEPORATE OUT THE URL ON THE &
        NSArray *urlParamatersArray = [urlParamaters componentsSeparatedByString:@"&"];
        
        if([urlParamatersArray count] == 1) {
            NSString *keyValue = [urlParamatersArray objectAtIndex:(0)];
            NSArray *keyValueArray = [keyValue componentsSeparatedByString:@"="];
            
            if([[keyValueArray objectAtIndex:(0)] isEqualToString:@"NeverGonnaFindMeaccess_token"]) {
   //             if (!self.masterViewController) {
                    self.masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
     //           }
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
    return YES;
}

@end
