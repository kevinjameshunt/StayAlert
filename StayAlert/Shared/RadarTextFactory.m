//
//  RadarTextFactory.m
//  StayAlert
//
//  Created by KevinHunt on 2018-10-29.
//  Copyright © 2018 Prophet Studios. All rights reserved.
//

#import "RadarTextFactory.h"

@implementation RadarTextFactory

static RadarTextFactory *_shared;

+ (nullable RadarTextFactory *)shared {
    @synchronized([RadarTextFactory class]) {
        
        // Initialize the shared object if it does not already exist
        if(!_shared) {
            NSLog(@"Creating radar text factory");
            _shared  = [[RadarTextFactory alloc] init];
        }
        
        //        NSLog(@"Returning shared radar text factory");
        return _shared;
    }
    
    return nil;
}

- (id)init {
    if(self = [super init]) {

    }
    
    return self;
}

- (NSString *)getRadarText {
    // Open file containing list of IAP IDs
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL success;
    NSString *defaultPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"radarText.json"];
    success = [fileManager fileExistsAtPath:defaultPath];
    if (success){
        // Get the data and parse it
        NSData *adData = [NSData dataWithContentsOfFile:defaultPath];
        NSDictionary *adsDict = [NSJSONSerialization JSONObjectWithData:adData options:0 error:&error];
        
        // If we successfully parsed it
        if (adsDict && adsDict.count > 0) {
            // Get the array of text items
            NSArray *objectArray = [adsDict objectForKey:@"radarText"];
            
            int i = arc4random() % 11;
            return [objectArray objectAtIndex:i];
        }
    }
    return @"";
}

@end
