//
//  ViewController.m
//  poiFinderv1.0
//
//  Created by Anthony Dagati on 11/23/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyBest;
    lm.distanceFilter = kCLDistanceFilterNone;
    [lm startUpdatingLocation];
    
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [searchVC localSearchForPOI:self.searchTextField.text mapView:self.mapView];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // Get the current location
    CLLocation *currentLocation = [locations lastObject];
    
    // Get the latest location coordinates
    CLLocationDegrees latitude = currentLocation.coordinate.latitude;
    CLLocationDegrees longitude = currentLocation.coordinate.longitude;
    CLLocationCoordinate2D locationCoordinates = CLLocationCoordinate2DMake(latitude, longitude);
    
    // Zoom in our map
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(locationCoordinates, 1000, 1000);
    MKCoordinateRegion adjustRegion = [mapView regionThatFits:viewRegion];
    [mapView setRegion:adjustRegion animated:YES];
    
    NSLog(@"%@", currentLocation);
    
}

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithOverlay:overlay];
    polylineView.strokeColor = [UIColor orangeColor];
    polylineView.lineWidth = 5.0;
    return polylineView;
}

@end
