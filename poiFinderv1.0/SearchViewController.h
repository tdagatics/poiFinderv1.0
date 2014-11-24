//
//  SearchViewController.h
//  poiFinderv1.0
//
//  Created by Anthony Dagati on 11/23/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TableViewController.h"

@interface SearchViewController : UIViewController

-(void)localSearchForMapPOI:(NSString *)searchText mapView:(MKMapView *)mapView;
-(NSMutableDictionary *)localSearchForTableViewPOI:(NSString *)searchText;

@end
