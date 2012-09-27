//
//  MasterViewController.h
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate, EGORefreshTableHeaderDelegate>{

EGORefreshTableHeaderView *_refreshHeaderView;
BOOL _reloading;
}

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *data;
@property (retain, nonatomic) IBOutlet UITableView *feedTable;

@end
