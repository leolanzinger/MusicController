//
//  RdfParser.h
//  MusicController
//
//  Created by Leonardo Lanzinger on 20/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Redland-ObjC.h>

@interface RdfParser : NSObject

- (void) parseRDFXML:(NSString *)rdfString;
- (void) parseAccelerometerGestures:(NSString *)rdfString;
- (void) parseCameraGestures:(NSString *)rdfString;

@end
