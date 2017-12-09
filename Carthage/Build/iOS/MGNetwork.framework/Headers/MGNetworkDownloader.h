//
//  MGNetworkDownloader.h
//  MGNetwork
//
//  Created by Gohary on 12/9/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    GET,
    POST,
    PUT,
    DELETE,
} HTTPRequestType;

@interface MGNetworkDownloader : NSObject
+ (void) returnWelcomeMessage:(NSString *)name withHandler:(void (^) (NSString *response))handler;


+ (void) get:(NSString *)urlString andResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error ))responseHandler;

+ (void) get:(NSString *)urlString andParameters:(NSDictionary *)params andResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error ))responseHandler;
@end
