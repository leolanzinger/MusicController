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

static const NSTimeInterval updateTime = 0.1;//using large interval (to not stress the CPU)

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

//This method parse the data and return one string accordingly to the movement
- (NSString *)accelerometerRecognizer:(CMAccelerometerData *)accelerometerData {
    //NSLog(@"\n\tx:%f, y:%f, z:%f", accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z);
    NSString *detectedShake = @"";
    //this numbers are temporally numbers just to test
    //Whatch out the one shake is of course imperfect
    //x asses: left right
    //shake once to left
    if (accelerometerData.acceleration.x > 3.0) {
        NSLog(@"Detected shake once to left");
        detectedShake = @"OneLeft";
    }
    //shake once to left
    if (accelerometerData.acceleration.x < -3.0) {
        NSLog(@"Detected shake once to right");
        detectedShake = @"OneRight";
    }
    //y asses: up down
    //shake once up
    if (accelerometerData.acceleration.y > 3.0) {
        NSLog(@"Detected shake once up");
        detectedShake = @"OneUp";
    }
    //shake once down
    if (accelerometerData.acceleration.y < -3.0) {
        NSLog(@"Detected shake once down");
        detectedShake = @"OneDown";
    }
    //z asses: top bottom
    //shake once top
    if (accelerometerData.acceleration.z > 3.0) {
        NSLog(@"Detected shake once top");
        detectedShake = @"OneTop";
    }
    //shake once bottom
    if (accelerometerData.acceleration.z < -3.0) {
        NSLog(@"Detected shake once bottom");
        detectedShake = @"OneBottom";
    }
    return detectedShake;
}

@end
