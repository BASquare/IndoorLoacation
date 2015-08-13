//
//  InfoView.h
//  IndorLocation
//
//  Created by Taras Sheremet on 21/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageView.h"

@interface InfoView : PageViewController <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptonLabel;
@property (weak, nonatomic) IBOutlet UITableView *listView;

- (id)initWithData:(id)data;
- (IBAction)onClose:(id)sender;

@end