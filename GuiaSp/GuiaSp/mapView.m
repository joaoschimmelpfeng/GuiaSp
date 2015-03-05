//
//  ViewController.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 27/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "mapView.h"
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface mapView ()

@end

@implementation mapView
@synthesize mapa, locationManager,ponto,latitude,longitude,dados;

- (void)viewDidLoad{

    [super viewDidLoad];

    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDelegate:self];
    [mapa setDelegate:self];
    
    
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    MKCoordinateRegion referencia = {{0.0,0.0},{0.0,0.0}};
    referencia.center.latitude = [latitude doubleValue];
    referencia.center.longitude = [longitude doubleValue];
    ponto = [[MKPointAnnotation alloc]init];
    ponto.coordinate = referencia.center;
    //[self tracaRota];
    
    [locationManager startUpdatingLocation];
    
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"%@",[locations lastObject]);
    
    _loc = [[locations lastObject] coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_loc, 200, 200);
    
    [self tracaRota];
    
    [mapa setRegion:region animated:YES];
    [manager stopUpdatingLocation];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 7.0;
    return renderer;
}

-(void)update:(PFObject *)idados
{
    dados = idados;
    latitude = dados[@"latitude"];
    longitude = dados[@"longitude"];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
}

-(void)tracaRota{
    MKCoordinateRegion referencia = {{0.0,0.0},{0.0,0.0}};
    referencia.center.latitude = [latitude doubleValue];
    referencia.center.longitude = [longitude doubleValue];
    ponto = [[MKPointAnnotation alloc]init];
    ponto.coordinate = referencia.center;
    
    MKPlacemark *source = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(_loc.latitude, _loc.longitude) addressDictionary:nil ];
    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    [srcMapItem setName:@"origem"];
    
    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(ponto.coordinate.latitude,ponto.coordinate.longitude) addressDictionary:nil ];
    MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
    [distMapItem setName:@"destino"];
    
    MKPointAnnotation *pm = [[MKPointAnnotation alloc]init];
    pm.coordinate = destination.coordinate;
    [mapa addAnnotation:pm];
    
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:srcMapItem];
    [request setDestination:distMapItem];
    [request setTransportType:MKDirectionsTransportTypeAutomobile];
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Erro ao buscar rota: %@",error.debugDescription);
        } else {
            NSArray *arrRoutes = [response routes];
            for (MKRoute *route in arrRoutes) {
                [mapa addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
            }
        }
        
        //        NSLog(@"response = %@",response);
        //        NSArray *arrRoutes = [response routes];
        //        [arrRoutes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //
        //            MKRoute *rout = obj;
        //
        //            MKPolyline *line = [rout polyline];
        //            [mapaEstrela addOverlay:line];
        //            NSLog(@"Rout Name : %@",rout.name);
        //            NSLog(@"Total Distance (in Meters) :%f",rout.distance);
        //
        //            NSArray *steps = [rout steps];
        //
        //            NSLog(@"Total Steps : %lu",(unsigned long)[steps count]);
        //
        //            [steps enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //                NSLog(@"\nRout Instruction : %@",[obj instructions]);
        //                NSLog(@"\nRout Distance : %.0f",[obj distance]);
        //            }];
        //        }];
    }];
    
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
