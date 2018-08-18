//
//  NetworkManager.m
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager ()

@property (nonatomic, strong) NSMutableArray <Cafe*> *cafeArray;

@end

@implementation NetworkManager

- (void) getDataFromUrlAndParse{
    self.cafeArray = [[NSMutableArray alloc] init];
    float latitude = 49.2812;
    float longitude = -123.1170317;
    NSString *urlString = [NSString stringWithFormat:@"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=%f&longitude=%f", latitude, longitude];
    NSURL *url = [NSURL URLWithString:urlString]; // 1
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url]; // 2
    [urlRequest addValue:@"Bearer -t22e0EIDts6e4v2APHQI4PVEsedcM4voHDSk2HMvWg_tyc1-cf2MKT0LkYcMxP-RoIPLaR_LB9b_26h669A8V1HLhe4JjMzHcW9ixDAOTLaZ_i2P9XE-KOUlWF3W3Yx" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 3
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 4
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *yelpDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) { // 3
            // Handle the error
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        NSArray* businesses = yelpDictionary[@"businesses"];
        // If we reach this point, we have successfully retrieved the JSON from the API
        for (NSDictionary *business in businesses){ // 4
            Cafe *cafe = [[Cafe alloc] init];
            
            cafe.name = business[@"name"];
            cafe.phone = business[@"phone"];
            cafe.rating = business[@"rating"];
            cafe.image_url = business[@"image_url"]; //the easy ones
            
            NSDictionary *coordinates = business[@"coordinates"];
            cafe.longitude = [coordinates valueForKey:@"longitude"];
            cafe.latitude = [coordinates valueForKey:@"latitude"]; //a little deeper for coordinates
            
            NSDictionary *location = business[@"location"];
            NSArray *displayAddress = [location valueForKey:@"display_address"];
            NSString *address = [displayAddress objectAtIndex:0];
            NSString *city = [displayAddress objectAtIndex:1];
            NSString *country = [displayAddress objectAtIndex:2];
            cafe.display_address = [NSString stringWithFormat:@"%@, %@, %@", address, city, country]; //tough to get this address
            
            [self.cafeArray addObject:cafe]; //add it
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //  [self.UITableView reloadData];
        }];
    }];
    [dataTask resume]; // 6
}
@end

