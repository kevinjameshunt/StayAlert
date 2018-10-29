//
//  InterfaceController.m
//  StayAlertWatch Extension
//
//  Created by KevinHunt on 2018-10-27.
//  Copyright © 2018 Prophet Studios. All rights reserved.
//

#import "InterfaceController.h"

#define kRadarImgFrameCount 10

@interface InterfaceController ()

@end


@implementation InterfaceController {
    NSTimer *_timer;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [_radarImg setImageNamed:@"radar"];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    [_radarImg stopAnimating];
    
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)radarBtnPressed:(id)sender {
    // Normal Animation
    [_radarImg startAnimatingWithImagesInRange:NSMakeRange(0, 11) duration:0.5 repeatCount:0];
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [weakSelf performSelectorOnMainThread:@selector(pushText) withObject:nil waitUntilDone:NO];
    }];
}

- (void)pushText {
    [_radarImg stopAnimating];
    [self pushControllerWithName:@"RadarTextInterfaceController" context:nil];
}



@end



