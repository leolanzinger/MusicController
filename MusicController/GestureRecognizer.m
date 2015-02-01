//
//  GestureRecognizer.m
//  MusicController
//
//  Created by Martino Giacchetti on 01/02/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

#import "GestureRecognizer.h"

@implementation GestureRecognizer

-(instancetype)init
{
    self = [super init];
    if (self) {
        //code
        motionManager = [[CMMotionManager alloc]init];
        
    }
    return self;
}


@end
