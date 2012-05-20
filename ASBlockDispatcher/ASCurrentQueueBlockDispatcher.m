//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASCurrentQueueBlockDispatcher.h"

@implementation ASCurrentQueueBlockDispatcher

+ (id) dispatcher
{
    return [[[[self class] alloc] init] autorelease];
}

#pragma mark - ASBlockDispatcher

- (void) dispatchSyncBlock:(void(^)(void))block
{
    if (block) {
        block();
    }
}
- (void) dispatchAsyncBlock:(void(^)(void))block
{
    if (block) {
        dispatch_async(dispatch_get_current_queue(), block);
    }
}

@end
