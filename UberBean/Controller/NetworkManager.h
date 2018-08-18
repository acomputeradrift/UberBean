//
//  NetworkManager.h
//  UberBean
//
//  Created by Jamie on 2018-08-17.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cafe.h"

@interface NetworkManager : NSObject

@property (nonatomic, strong) NSDictionary *dictionary;

- (void) getDataFromUrlAndParse;

@end
