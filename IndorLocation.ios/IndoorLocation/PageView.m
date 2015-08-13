//
//  PageView.m
//  IndorLocation
//
//  Created by Taras Sheremet on 21/1/15.
//  Copyright (c) 2015 TarasSheremet. All rights reserved.
//

#import "PageView.h"
#import "HeaderView.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	HeaderView * header = [HeaderView autolayoutView];
	[self.view addSubview:header];
	[self.view sendSubviewToBack:header];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
