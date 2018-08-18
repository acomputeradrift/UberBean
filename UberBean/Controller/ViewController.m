//
//  ViewController.m
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    [networkManager getDataFromUrlAndParse];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


