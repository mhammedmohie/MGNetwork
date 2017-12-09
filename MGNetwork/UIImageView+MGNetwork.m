//
//  UIImageView+MGNetwork.m
//  MGNetwork
//
//  Created by Gohary on 12/9/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import "UIImageView+MGNetwork.h"
#import "MGNetworkDownloader.h"
@implementation UIImageView (MGNetwork)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) setImageWithURL:(NSString *)url{
    typeof(self) __weak weakSelf = self;

    [MGNetworkDownloader get:url andResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil && data.length >0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setImage:[UIImage imageWithData:data]];
            });
        }
    }];
}

@end
