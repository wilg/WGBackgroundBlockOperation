//
//  WGBackgroundBlockOperation.h
//
//  Created by Wil Gieseler on 5/28/13.
//  Copyright (c) 2013 Wil Gieseler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WGBackgroundBlockOperation : NSBlockOperation

@property (assign) BOOL automaticallyEndsBackgroundTask;

- (void)endBackgroundTask;

@end
