//
//  Created by Lukasz Warchol on 6/12/12.
//


#import "ASSyncBlockRunner.h"


@implementation ASSyncBlockRunner

+ (id) blockRunner
{
    return [[[self alloc] init] autorelease];
}

#pragma mark - ASBlockRunner

- (void) runBlock:(void(^)(void))block onQueue:(dispatch_queue_t)queue
{
    if (block) {
        if (dispatch_get_current_queue() == queue) {
            // When dispatching block synchronously on the same queue we can not use dispatch_sync()
            // since it would wait for a queue to be in idle state, we would endup in a dead lock.
            block();
        }else {
            dispatch_sync(queue, block);
        }
    }
}

@end
