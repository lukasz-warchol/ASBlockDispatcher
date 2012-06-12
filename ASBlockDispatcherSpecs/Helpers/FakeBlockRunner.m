//
//  Created by Lukasz Warchol on 6/12/12.
//


#import "FakeBlockRunner.h"


@implementation FakeBlockRunner {
    dispatch_queue_t _queue;
}
@synthesize block = _block;

#pragma mark - Lifecycle

+ (id)blockRunner {
    return [[[self alloc] init] autorelease];
}

- (void)dealloc {
    [_block release];
    [super dealloc];
}

#pragma mark - Accessors

- (void) setQueue:(dispatch_queue_t)queue
{
    if (_queue) {
        dispatch_release(_queue);
    }
    if (queue) {
        dispatch_retain(queue);
    }
    _queue = queue;
}
- (dispatch_queue_t)queue
{
    return _queue;
}

#pragma mark - ASBlockRunner

- (void)runBlock:(void (^)(void))block onQueue:(dispatch_queue_t)queue {
    self.block = block;
    self.queue = queue;
}

@end
