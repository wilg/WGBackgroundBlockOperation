# WGBackgroundBlockOperation

A drop-in replacement for NSBlockOperation that **automatically configures itself as a background task**. iOS only, obviously.

This is nice because you don't have to keep track of any pesky UIBackgroundTaskIdentifier or anything like that.

## Installation

(pending) Add this line to your application's Podfile:

```ruby
pod 'WGBackgroundBlockOperation'
```

## Usage

Say you have a pretty simple long-running task:

```objective-c
[NSOperationQueue.mainQueue addOperation:[WGBackgroundBlockOperation blockOperationWithBlock:^{
    [self someLongRunningTask];
}];
```

If your operation block spawns other operations, you might want to end the background task manually:


```objective-c
__block WGBackgroundBlockOperation *op = [WGBackgroundBlockOperation blockOperationWithBlock:^{
    [self postAGiantImageToLetsSaySomeKindOfServerWithCompletionBlock:^{
       [self completeUpload];
       [op endBackgroundTask];
    }];
}];
op.automaticallyEndsBackgroundTask = NO;
[NSOperationQueue.mainQueue addOperation:op];
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
