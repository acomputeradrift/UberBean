//
//  ViewController.m
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"

#import "NetworkManager.h"

@import CoreLocation;
@import MapKit;

@interface ViewController () <CLLocationManagerDelegate,MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic,strong) CLLocationManager *locationManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    [self.mapView setRegion:MKCoordinateRegionMake(self.locationManager.location.coordinate,
                                                   MKCoordinateSpanMake(0.05, 0.05))
                   animated:YES];
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    [networkManager getDataFromUrlAndParse:self.locationManager.location.coordinate completionHandler:^(NSArray * _Nullable cafeArray) {
        
         [self.mapView addAnnotations: cafeArray];
    }];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"Did update location");
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Did fail with error");
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        //[manager startUpdatingLocation];
        [self.locationManager requestLocation];
    }else{
        NSLog(@"The answer is NO!!!");
    }
}

@end
