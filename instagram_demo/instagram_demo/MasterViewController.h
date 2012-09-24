//
//  MasterViewController.h
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PullToRefreshView.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (retain, nonatomic) IBOutlet UITableView *feedTable;
@end
