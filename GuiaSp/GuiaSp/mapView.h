//
//  ViewController.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 27/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>

@interface mapView : UIViewController<CLLocationManagerDelegate>

@property CLLocationCoordinate2D loc;
@property MKCoordinateRegion region, usuario;
@property MKPointAnnotation *ponto;
@property NSNumber *latitude;
@property NSNumber *longitude;
@property PFObject *dados;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (retain, nonatomic)CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *distancia;

- (IBAction)Opcoes:(id)sender;
- (IBAction)localUser:(id)sender;
- (IBAction)direction:(id)sender;


-(void)update:(PFObject *)idados;
-(void)tracaRota;
@end

