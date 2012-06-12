//
//  Created by Lukasz Warchol on 6/12/12.
//


#import "ASAsyncBlockRunner.h"


@implementation ASAsyncBlockRunner

+ (id) blockRunner
{
    return [[[self alloc] init] autorelease];
}

#pragma mark - ASBlockRunner

- (void) runBlock:(void(^)(void))block onQueue:(dispatch_queue_t)queue
{
    if (block) {
        dispatch_async(queue, block);
    }
}

@end
