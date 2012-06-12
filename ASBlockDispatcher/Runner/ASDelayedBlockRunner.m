//
//  Created by Lukasz Warchol on 6/12/12.
//


#import "ASDelayedBlockRunner.h"


@implementation ASDelayedBlockRunner
@synthesize delay = _delay;

+ (id) blockRunnerWithDelayTime:(NSTimeInterval)delay
{
    ASDelayedBlockRunner *blockRunner = [[[self alloc] init] autorelease];
    blockRunner.delay = delay;
    return blockRunner;
}

#pragma mark - ASBlockRunner

- (void) runBlock:(void(^)(void))block onQueue:(dispatch_queue_t)queue
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (self.delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@end
