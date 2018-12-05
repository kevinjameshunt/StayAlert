//
//  RadarTextFactory.h
//  StayAlert
//
//  Created by KevinHunt on 2018-10-29.
//  Copyright © 2018 Prophet Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Shared factory for getting the radar safety tip text from the JSON file
 */
@interface RadarTextFactory : NSObject

/*
 * Returns the shared instance of the radar text factory
 */
+ (nullable RadarTextFactory *)shared;

/*
 * Retrieve a randomly generated radar safety tip from local storage
 * @return An NSString representing the radar safety tip text
 */
- (NSString *)getRadarText;

@end
