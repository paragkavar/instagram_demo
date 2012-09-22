//
//  LoginViewController.h
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@interface LoginViewController : UIViewController <UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) MasterViewController *masterViewController;

@end
