//
//  Cafe.m
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "Cafe.h"
@interface Cafe ()
//private properties



@end

@implementation Cafe


+ (instancetype) initWithDictionary: (NSDictionary*)dictionary {
    Cafe *cafe = [[Cafe alloc] init];
    cafe.name = dictionary[@"name"];
    cafe.phone = dictionary[@"phone"];
    cafe.rating = dictionary[@"rating"];
    cafe.image_url = dictionary[@"image_url"]; //the easy ones
    
    NSDictionary *coordinates = dictionary[@"coordinates"];
    NSNumber *longitudeNumber = [coordinates valueForKey:@"longitude"];
    NSNumber *latitudeNumber = [coordinates valueForKey:@"latitude"];
    CLLocationDegrees latitude = [latitudeNumber doubleValue];
    CLLocationDegrees longitude = [longitudeNumber doubleValue];
    [cafe setLocation:CLLocationCoordinate2DMake(latitude, longitude)];
    
    cafe.longitude = [coordinates valueForKey:@"longitude"];
    cafe.latitude = [coordinates valueForKey:@"latitude"]; //a little deeper for coordinates
    
    NSDictionary *location = dictionary[@"location"];
    NSArray *displayAddress = [location valueForKey:@"display_address"];
    NSString *address = [displayAddress objectAtIndex:0];
    NSString *city = [displayAddress objectAtIndex:1];
    NSString *country = [displayAddress objectAtIndex:2];
    cafe.display_address = [NSString stringWithFormat:@"%@, %@, %@", address, city, country]; //tough to get this address
    return cafe;
}

- (void) setLocation: (CLLocationCoordinate2D)coordinate {
    _coordinate = coordinate;
}

@end
