//
//  radarTextInterfaceController.m
//  StayAlertWatch Extension
//
//  Created by KevinHunt on 2018-10-27.
//  Copyright © 2018 Prophet Studios. All rights reserved.
//

#import "RadarTextInterfaceController.h"
#import "RadarTextFactory.h"

@interface RadarTextInterfaceController ()

@end

@implementation RadarTextInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    self.radarText.text = [[RadarTextFactory shared] getRadarText];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



