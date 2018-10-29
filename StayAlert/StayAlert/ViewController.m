//
//  ViewController.m
//  StayAlert
//
//  Created by KevinHunt on 2018-10-27.
//  Copyright © 2018 Prophet Studios. All rights reserved.
//

#import "ViewController.h"
#import "RadarTextFactory.h"

#define kRadarImgFrameCount 10

@interface ViewController ()

@end

@implementation ViewController {
    NSTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    [_radarImg stopAnimating];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)radarBtnTapped:(id)sender {
    _textView.text = @"";
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i <= kRadarImgFrameCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"radar%d.png",i];
        [images addObject:[UIImage imageNamed:imageName]];
    }
    
    _radarImg.animationImages = images;
    _radarImg.animationDuration = 0.5;
    
    [_radarImg startAnimating];
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [weakSelf performSelectorOnMainThread:@selector(updateText) withObject:nil waitUntilDone:NO];
    }];
}

- (void)updateText {
    [self.radarImg stopAnimating];
    self.textView.text = [[RadarTextFactory shared] getRadarText];
}

@end
