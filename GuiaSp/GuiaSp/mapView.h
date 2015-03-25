

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
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

