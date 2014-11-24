//
//  SearchViewController.m
//  poiFinderv1.0
//
//  Created by Anthony Dagati on 11/23/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)localSearchForMapPOI:(NSString *)searchText mapView:(MKMapView *)mapView
{
    NSLog(@"Just checking: %@", searchText);
    // Use the search string to build the URL query and get data from Google
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchText;
    request.region = mapView.region;
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *item in response.mapItems) {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = item.name;
            annotation.coordinate = item.placemark.coordinate;
            annotation.subtitle = [NSString stringWithFormat:@"%@, %@ %@", item.placemark.addressDictionary[@"Street"], item.placemark.addressDictionary[@"State"], item.placemark.addressDictionary[@"ZIP"]];
            [mapView addAnnotation:annotation];
            
        }
    }];

}

-(NSMutableDictionary *)localSearchForTableViewPOI:(NSString *)searchText
{
    NSLog(@"Just checking: %@", searchText);
    // Use the search string to build the URL query and get data from Google
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchText;
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    NSMutableDictionary *dictionaryOfPlaces = @{};
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        for (MKMapItem *item in response.mapItems) {
            [dictionaryOfPlaces addEntriesFromDictionary:item];
            NSLog(@"Check search results: %@", response);
    }
    }];
    
    return dictionaryOfPlaces;
}



#pragma mark - MKMapViewDelegate Methods

/*

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // Define your reuse identifier.
    static NSString *identifier = @"MapPoint";
    
    if ([annotation isKindOfClass:[MapPoint class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        return annotationView;
    }
    return nil;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
