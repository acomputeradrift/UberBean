//
//  NetworkManager.h
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cafe.h"
@import MapKit;
@import CoreLocation;

@interface NetworkManager : NSObject

@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSMutableArray <Cafe*> *cafeArray;


- (void) getDataFromUrlAndParse: (CLLocationCoordinate2D)coordinates completionHandler:(void(^) (NSArray <MKAnnotation> * cafeArray))completionBlock;

@end
