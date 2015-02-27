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
<<<<<<< HEAD
    
    float threshold_for_holding = 0.25;
    float threshold_for_gesture = 0.30;
    float time_gesture = 0.8;
    //for this gestures the accelerometer should be x:0 y:0 z:-1
    if (!gesture_started) {
        if ((fabsf(accelerometerData.acceleration.x) < threshold_for_holding) && (fabsf(accelerometerData.acceleration.y) < threshold_for_holding)) {
            gesture_started = true;
            NSLog(@"ready");
        }
    }else{
        if (!time_setted && fabsf(accelerometerData.acceleration.x) > threshold_for_holding) {
            previous_x_value = accelerometerData.acceleration.x;
            time_begin = CFAbsoluteTimeGetCurrent();
            time_setted = true;
        }
        
        //previous and next song
        if (fabs(accelerometerData.acceleration.x - 1) < threshold_for_gesture) {
            time_end = CFAbsoluteTimeGetCurrent();
            gesture_started = false;
            time_setted = false;
            if (time_end - time_begin < time_gesture) {
                NSLog(@"Gesture detected: NEXT");
                detectedShake = @"Next";
                return detectedShake;
            }
        }else if (fabs(accelerometerData.acceleration.x + 1) < threshold_for_gesture){
            time_end = CFAbsoluteTimeGetCurrent();
            gesture_started = false;
            time_setted = false;
            if (time_end - time_begin < time_gesture) {
                NSLog(@"Gesture detected: PREW");
                detectedShake = @"Previous";
                return detectedShake;
            }
        }
        
        //volume up and down
        if (fabs(accelerometerData.acceleration.y - 1) < threshold_for_gesture) {
            time_end = CFAbsoluteTimeGetCurrent();
            gesture_started = false;
            time_setted = false;
            if (time_end - time_begin < time_gesture) {
                NSLog(@"Gesture detected: Volume DOWN");
                detectedShake = @"Down";
                return detectedShake;
            }
        }else if (fabs(accelerometerData.acceleration.y + 1) < threshold_for_gesture){
            time_end = CFAbsoluteTimeGetCurrent();
            gesture_started = false;
            time_setted = false;
            if (time_end - time_begin < time_gesture) {
                NSLog(@"Gesture detected: Volume UP");
                detectedShake = @"Up";
                return detectedShake;
            }
        }
=======
    //this numbers are temporally numbers just to test
    //Whatch out the one shake is of course imperfect
    //x asses: left right
    //shake once to left
    if (accelerometerData.acceleration.x > 3.0) {
        NSLog(@"Detected shake once to left");
        detectedShake = @"OneLeft";
>>>>>>> 15eace05037fa0d8be2b73c042b086a067065d3f
    }
    //shake once to left
    if (accelerometerData.acceleration.x < -3.0) {
        NSLog(@"Detected shake once to right");
        detectedShake = @"OneRight";
    }
    //z asses: up down
    //shake once up
    if (accelerometerData.acceleration.z > 3.0) {
        NSLog(@"Detected shake once up");
        detectedShake = @"OneLeft";
    }
    //shake once down
    if (accelerometerData.acceleration.z < -3.0) {
        NSLog(@"Detected shake once down");
        detectedShake = @"OneRight";
    }
    
    return detectedShake;
}

@end
