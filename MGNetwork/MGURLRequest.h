//
//  MGURLRequest.h
//  MGHTTP
//
//  Created by Gohary on 12/3/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGNetworkDownloader.h"

@interface MGURLRequest : NSMutableURLRequest
- (instancetype) initWithURL:(NSURL*) URL requestType:(HTTPRequestType)type andParamaeters:(NSDictionary *)params;
@end
