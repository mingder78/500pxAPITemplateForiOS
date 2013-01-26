//
//  DataViewController.m
//  test1
//
//  Created by Ming-der Wang on 01/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DataViewController.h"
#import <PXAPI/PXAPI.h>

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end