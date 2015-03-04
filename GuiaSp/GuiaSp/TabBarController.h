//
//  TabBarController.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DescView.h"
#import "mapView.h"
#import "LocalizationManager.h"

@interface TabBarController : UITabBarController

@property PFObject *dados;
@property DescView *descView;
@property mapView *map;
@property LocalizationManager *locMan;
-(void) update;
@end
