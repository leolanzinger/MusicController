//
//  GestureRecognizer.h
//  MusicController
//
//  Created by Martino Giacchetti on 01/02/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//


//maybe there is to include the framework

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface GestureRecognizer : NSObject
{
    CMMotionManager *motionManager;
}


@end
