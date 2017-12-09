//
//  MGURLRequest.m
//  MGHTTP
//
//  Created by Gohary on 12/3/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import "MGURLRequest.h"

@implementation MGURLRequest

/**
 T

 */
- (instancetype) initWithURL:(NSURL *)URL requestType:(HTTPRequestType )type andParamaeters:(NSDictionary *)params{
    self = [super init];

    [self setHTTPMethod:[self requestTypeStringFromType:type]];
    [self setURL:URL];

    return self;
}

-(NSString *) requestTypeStringFromType:(HTTPRequestType)type{

    switch (type) {
        case POST:
            return @"POST";
            break;
        case GET:
            return @"GET";
            break;
        case PUT:
            return @"PUT";
            break;
        case DELETE:
            return @"DELETE";
            break;
        default:
            return @"GET";
            break;
    }
}
@end
