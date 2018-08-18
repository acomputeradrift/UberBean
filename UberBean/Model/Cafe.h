//
//  Cafe.h
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cafe : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *display_address;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSDictionary *dictionary;

- (instancetype)initWithDictionary: (NSDictionary*)dictionary;

@end
