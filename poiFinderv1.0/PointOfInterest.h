//
//  PointOfInterest.h
//  poiFinderv1.0
//
//  Created by Anthony Dagati on 11/23/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PointOfInterest : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * longitude;

@end
