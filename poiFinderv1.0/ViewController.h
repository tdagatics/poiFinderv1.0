//
//  ViewController.h
//  poiFinderv1.0
//
//  Created by Anthony Dagati on 11/23/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SearchViewController.h"

@interface ViewController : UIViewController <MKMapViewDelegate, MKAnnotation, MKOverlay, CLLocationManagerDelegate>

{
    CLLocationManager *lm;
    MKMapRect routeRect;
    MKPolylineView *routeLineView;
    MKPolyline *routeLine;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
- (IBAction)searchButton:(id)sender;

@end
