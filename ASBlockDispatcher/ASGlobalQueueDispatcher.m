//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASGlobalQueueDispatcher.h"

@implementation ASGlobalQueueDispatcher

#pragma mark - Lifecycle

+ (id) dispatcher
{
    return [[self class] dispatcherWithPriority:DISPATCH_QUEUE_PRIORITY_DEFAULT];
}

+ (id) dispatcherWithPriority:(dispatch_queue_priority_t)prioryty
{
    ASGlobalQueueDispatcher* dispatcher = [[[self alloc] init] autorelease];
    dispatcher.queue = dispatch_get_global_queue(prioryty, 0);
    return dispatcher;
}

//! Unavailable, use +dispatcher or +dispatcherWithPriority: instead;
+ (id) dispatcherWithQueue:(dispatch_queue_t)queue
{
    [[NSException exceptionWithName:NSObjectNotAvailableException 
                             reason:@"Usage of this methos is restricted. Use +dispatcher or +dispatcherWithPriority: istead." 
                           userInfo:nil] raise];
    return nil;
}

@end
