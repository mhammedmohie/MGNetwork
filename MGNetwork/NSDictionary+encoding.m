//
//  NSDictionary+encoding.m
//  MGHTTP
//
//  Created by Gohary on 12/5/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import "NSDictionary+encoding.h"

@implementation NSDictionary (encoding)

- (NSString *)prepareGetRequestParameters{

    NSMutableArray *parts = [NSMutableArray array];
    for (NSString *key in self.allKeys) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", key, value];
        [parts addObject: part];
    }
    NSString *finalString = [[parts componentsJoinedByString: @"&"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"%@", finalString);
    return finalString?finalString:@"";
}
@end
