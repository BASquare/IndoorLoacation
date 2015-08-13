//
//  InfoView.m
//  IndorLocation
//
//  Created by Taras Sheremet on 21/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"
#import "InfoView.h"

#import "Constants.h"

@interface InfoView ()

@end

@implementation InfoView {
	id _infoData;
}

- (id)initWithData:(id)data {
	self = [self initWithNibName:@"InfoView" bundle:nil];
	if (self) {
		_infoData = data;
		self.title = titleInfo;
	}
	return self;
}

- (IBAction)onClose:(id)sender {
	[[appDelegate() mainController] navigateBack];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.title = _infoData[fieldName];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_infoData[fieldRoomPeople] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
	}
	id value = _infoData[fieldRoomPeople][indexPath.row];
	cell.textLabel.text = value[fieldPersonName];
	cell.detailTextLabel.text = value[fieldPersonTitle];
	
	return cell;
}

@end
