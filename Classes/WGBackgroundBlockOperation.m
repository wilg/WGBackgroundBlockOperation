//
//  WGBackgroundBlockOperation.m
//
//  Created by Wil Gieseler on 5/28/13.
//  Copyright (c) 2013 Wil Gieseler. All rights reserved.
//

#import "WGBackgroundBlockOperation.h"

@interface WGBackgroundBlockOperation ()
@property (assign) UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@end

@implementation WGBackgroundBlockOperation

- (id)init {
    if (self = [super init]) {
        self.automaticallyEndsBackgroundTask = YES;
    }
    return self;
}

- (void)startBackgroundTask {
    self.backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundTask];
    }];
}

- (void)endBackgroundTask {
    if (self.backgroundTaskIdentifier != UIBackgroundTaskInvalid) {
        [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
        self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    }
}

- (void)addExecutionBlock:(void (^)(void))block {
    __weak typeof(self) weakSelf = self;
    [super addExecutionBlock:^{
        [weakSelf startBackgroundTask];
        block();
        if (weakSelf.automaticallyEndsBackgroundTask)
            [weakSelf endBackgroundTask];
    }];
}

@end
