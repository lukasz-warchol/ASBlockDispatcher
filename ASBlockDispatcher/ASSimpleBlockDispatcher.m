//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASSimpleBlockDispatcher.h"
#import "ASSyncBlockRunner.h"

@implementation ASSimpleBlockDispatcher {
    dispatch_queue_t _queue;
}
@synthesize blockRunner = _blockRunner;

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
    ASSimpleBlockDispatcher * dispatcher = [[[[self class] alloc] init] autorelease];
    dispatcher.queue = queue;
    return dispatcher;
}

- (id)init {
    self = [super init];
    if (self) {
        self.blockRunner = [ASSyncBlockRunner blockRunner];
    }
    return self;
}

- (void)dealloc {
    [_blockRunner release];
    self.queue = nil;
    [super dealloc];
}

#pragma mark - ASBlockDispatcher

- (void) dispatchBlock:(void(^)(void))block
{
    [self.blockRunner runBlock:block onQueue:self.queue];
}

@end
