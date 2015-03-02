//
//  ViewController.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 27/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapView : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UINavigationItem *botaoVoltar;
- (IBAction)Opcoes:(id)sender;


@end

