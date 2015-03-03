//
//  ViewController.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 27/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface mapView : UIViewController<CLLocationManagerDelegate>

{

 }

@property CLLocationCoordinate2D loc;
@property MKCoordinateRegion region;
@property MKPointAnnotation *ponto;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (retain, nonatomic)CLLocationManager *locationManager;

- (IBAction)Opcoes:(id)sender;

-(void)fazerRota;

@end

