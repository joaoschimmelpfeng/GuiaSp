//
//  ViewController.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 27/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "mapView.h"
#import <Parse/Parse.h>

@interface mapView ()

@end

@implementation mapView
@synthesize mapa;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Opcoes:(id)sender
{
    switch (((UISegmentedControl *) sender).selectedSegmentIndex)
    {
        case 1:
            mapa.mapType = MKMapTypeSatellite;
        break;
            
        case 0:
            mapa.mapType = MKMapTypeStandard;
        break;
            
        default:
            mapa.mapType = MKMapTypeHybrid;
        break;
    }
}
@end
