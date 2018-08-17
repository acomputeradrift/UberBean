//
//  ViewController.m
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"
@import CoreLocation;
@import MapKit;

@interface ViewController () <CLLocationManagerDelegate,MKMapViewDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.delegate = self;
    
    
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
    }NSLog(@"The answer is NO!!!");
    
}

@end
