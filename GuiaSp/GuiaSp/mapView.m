//
//  ViewController.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 27/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "mapView.h"

@interface mapView ()

@end

@implementation mapView
@synthesize mapa,botaoVoltar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    botaoVoltar.title = NSLocalizedString(@"SP Guide",nil);
    NSLog(NSLocalizedString(@"SP Guia",nil));
}

- (void)didReceiveMemoryWarning {
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
