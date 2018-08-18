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

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *display_address;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation Cafe

- (instancetype)initWithDictionary: (NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        _dictionary = dictionary;
    }
    return self;
}

@end
