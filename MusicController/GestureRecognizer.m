//
//  GestureRecognizer.m
//  MusicController
//
//  Created by Martino Giacchetti on 01/02/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

#import "GestureRecognizer.h"

@implementation GestureRecognizer

//Event frequency (Hz)  Usage
//10–20     Suitable for determining a device’s current orientation vector.
//30–60     Suitable for games and other apps that use the accelerometer for real-time user input.
//70–100    Suitable for apps that need to detect high-frequency motion. For example, you might use this interval to detect the user hitting the device or shaking it very quickly.

static const NSTimeInterval updateTime = 0.1;//0.1 is the largest interval (to not stress the CPU)

-(instancetype)init
{
    self = [super init];
    if (self) {
        //initi of the motion manager
        motionManager = [[CMMotionManager alloc]init];
        [motionManager startAccelerometerUpdates];
        //Set the time for the upload interval
        [motionManager setAccelerometerUpdateInterval:updateTime];
        //this method call the methot accelerometerREcognizer
        [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error){
            [self accelerometerRecognizer:accelerometerData];
            
        }];
    }
    return self;
}

//
- (NSString *)accelerometerRecognizer:(CMAccelerometerData *)accelerometerData {
    NSLog(@"Chiamato metodo");
    return @"NO";
}

@end
