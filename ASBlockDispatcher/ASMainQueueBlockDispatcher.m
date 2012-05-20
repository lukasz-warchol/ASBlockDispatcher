//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASMainQueueBlockDispatcher.h"

@implementation ASMainQueueBlockDispatcher

#pragma mark - Lifecycle

+ (id) dispatcher
{
    ASMainQueueBlockDispatcher* dispatcher = [[[self alloc] init] autorelease];
    dispatcher.queue = dispatch_get_main_queue();
    return dispatcher;
}

//! Unavailable, use +dispatcher instead;
+ (id) dispatcherWithQueue:(dispatch_queue_t)queue
{
    [[NSException exceptionWithName:NSObjectNotAvailableException 
                             reason:@"Usage of this methos is restricted. Use +dispatcher istead." 
                           userInfo:nil] raise];
    return nil;
}

@end
