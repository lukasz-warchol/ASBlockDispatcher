//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASSimpleBlockDispatcher.h"

@interface ASGlobalQueueDispatcher : ASSimpleBlockDispatcher

+ (id) dispatcher;
+ (id) dispatcherWithPriority:(dispatch_queue_priority_t)prioryty;

//! Unavailable, use +dispatcher or +dispatcherWithPriority: instead;
+ (id) dispatcherWithQueue:(dispatch_queue_t)queue __attribute__((unavailable));

@end
