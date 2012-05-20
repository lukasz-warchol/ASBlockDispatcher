//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASSimpleBlockDispatcher.h"

@implementation ASSimpleBlockDispatcher{
    dispatch_queue_t _queue;
}

#pragma mark - Getters

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

#pragma mark - Lifecycle

+ (id) dispatcherWithQueue:(dispatch_queue_t)queue
{
    ASSimpleBlockDispatcher* dispatcher = [[[[self class] alloc] init] autorelease];
    dispatcher.queue = queue;
    return dispatcher;
}

#pragma mark - ASBlockDispatcher

- (void) dispatchSyncBlock:(void(^)(void))block
{
    if (block) {
        if (dispatch_get_current_queue() == self.queue) {
            // When dispatching block synchronously on the same queue we can not use dispatch_sync()
            // since it would wait for a queue to be in idle state, we would endup in a dead lock.
            block();
        }else {
            dispatch_sync(self.queue, block);
        }
    }
}

- (void) dispatchAsyncBlock:(void(^)(void))block
{
    if (block) {
        dispatch_async(self.queue, block);
    }
}

@end
