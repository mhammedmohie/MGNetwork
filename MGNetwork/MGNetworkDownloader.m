//
//  MGNetworkDownloader.m
//  MGNetwork
//
//  Created by Gohary on 12/9/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import "MGNetworkDownloader.h"
#import "MGURLRequest.h"
#import "NSDictionary+encoding.m"

@implementation MGNetworkDownloader
+ (void) returnWelcomeMessage:(NSString *)name withHandler:(void (^) (NSString *response))handler {
    handler([NSString stringWithFormat:@"Welcome %@", name]);
}
static NSOperationQueue* requestsFiringQueue;

+ (void)initialize {
    if (!requestsFiringQueue) {
        requestsFiringQueue = [NSOperationQueue new];
        requestsFiringQueue.maxConcurrentOperationCount = 2;
    }
}

/**
 this method is used to add a get request to the current queue and start exuting it
 @param urlString the url string

 @Param responseHandler the completion parameter
 */
+ (void) get:(NSString *)urlString andResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error ))responseHandler{

    [self doRequestWithURL:urlString andType:GET andParameters:nil andResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        responseHandler(data, response, error);
    }];
}

/**
 this method is used to add a get request with url parameters to the current queue and start exuting it
 @param urlString the url string
 @param params the request parameters in Dictionary format
 @Param responseHandler the completion parameter
 */

+ (void) get:(NSString *)urlString andParameters:(NSDictionary *)params andResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error ))responseHandler{

    NSString *paramsString = params?[params prepareGetRequestParameters]:@"";
    [self doRequestWithURL:[urlString stringByAppendingString:paramsString] andType:GET andParameters:params andResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        responseHandler(data, response, error);
    }];
}



/**
 this method is used to add a request to the current queue and start exuting it
 @param url the url string
 @param type specifying the request type GET, POST, PUT or DELETE
 @param params the request parameters in Dictionary format
 @Param responseHandler the completion parameter
 */
+ (void) doRequestWithURL:(NSString *) url andType:(HTTPRequestType)type andParameters:(NSDictionary *)params andResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error ))responseHandler{
    MGURLRequest *request = [[MGURLRequest alloc]initWithURL:[NSURL URLWithString:url] requestType:type andParamaeters:params];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        responseHandler(data, response, error);
    }];
    [requestsFiringQueue addOperationWithBlock:^{
        [task resume];
    }];
}
@end
