//
//  TabBarController.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "TabBarController.h"
#import "LocalizationManager.h"
#import "mapView.h"
#import <Parse/Parse.h>

@interface TabBarController ()

@end

@implementation TabBarController
@synthesize dados,descView,locMan,map;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locMan = [LocalizationManager instance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void) update
{
    descView = [self.viewControllers objectAtIndex:0];
    map = [self.viewControllers objectAtIndex:1];
    [descView update:dados];
    [map update:dados];
    
    
}

@end
