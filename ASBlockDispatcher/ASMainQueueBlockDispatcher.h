//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASSimpleBlockDispatcher.h"

@interface ASMainQueueBlockDispatcher : ASSimpleBlockDispatcher

+ (id) dispatcher;

//! Unavailable, use +dispatcher instead;
+ (id) dispatcherWithQueue:(dispatch_queue_t)queue __attribute__((unavailable));

@end
