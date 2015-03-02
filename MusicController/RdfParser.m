//
//  RdfParser.m
//  MusicController
//
//  Created by Leonardo Lanzinger on 20/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

#import "RdfParser.h"

@implementation RdfParser

// standard parser template
- (void)parseRDFXML:(NSString *)rdfFile {
    if ([rdfFile length] > 0) {
        
        NSString *rdfPath = [[NSBundle mainBundle] pathForResource:rdfFile ofType:@"xml"];
        NSString *rdfString = [[NSString alloc] initWithContentsOfFile:rdfPath
                                                              encoding:NSUTF8StringEncoding
                                                                 error:nil];
        RedlandParser *parser = [RedlandParser parserWithName:RedlandRDFXMLParserName];
        RedlandURI *uri = [RedlandURI URIWithString:@"http://www.w3.org/1999/02/22-rdf-syntax-ns#"];
        RedlandModel *model = [RedlandModel new];

        // parse
        @try {
            [parser parseString:rdfString intoModel:model withBaseURI:uri];
        }
        @catch (NSException *exception) {
            NSLog(@"Failed to parse RDF: %@", [exception reason]);
        }
        
        /*
         *  Actual RDF parsing work (needs to be fixed)
        */
        
        RedlandNode *subject = [RedlandNode nodeWithURIString:@"InputModality"];
        RedlandNode *predicate = [RedlandNode nodeWithURIString:@"http://imi.org/"];
        RedlandStatement *statement = [RedlandStatement statementWithSubject:subject
                                                                   predicate:predicate
                                                                      object:nil];
        RedlandStreamEnumerator *query = [model enumeratorOfStatementsLike:statement];
        
        RedlandStatement *rslt = [query nextObject];
        // be aware that if literalValue can only be used on literal nodes.
        // object is the object-node of the RedlandStatement that is returned by the query.
        NSString *creator = [rslt.object literalValue];
        NSLog(@"Creator: %@", creator);
        
    }
}

// parse RDF if input has accelerometer gestures
- (void)parseAccelerometerGestures:(NSString *)rdfString {
    if ([rdfString length] > 0) {
    }
}

// parse RDF if input has camera recognized gestures
- (void)parseCameraGestures:(NSString *)rdfString {
    if ([rdfString length] > 0) {
    }
}

@end
