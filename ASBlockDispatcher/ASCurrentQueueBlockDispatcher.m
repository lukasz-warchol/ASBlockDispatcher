//
//  Created by Lukasz Warchol on 5/12/12.
//

#import "ASCurrentQueueBlockDispatcher.h"
#import "ASSyncBlockRunner.h"
#import "ASBlockRunner.h"

@implementation ASCurrentQueueBlockDispatcher
@synthesize blockRunner = _blockRunner;

+ (id) dispatcher
{
    return [[[[self class] alloc] init] autorelease];
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
    [super dealloc];
}

#pragma mark - ASBlockDispatcher

- (void) dispatchBlock:(void(^)(void))block
{
    [self.blockRunner runBlock:block onQueue:dispatch_get_current_queue()];
}

@end
