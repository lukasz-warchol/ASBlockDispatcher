//
//  Created by Lukasz Warchol on 6/12/12.
//


#import <Foundation/Foundation.h>
#import "ASBlockRunner.h"


@interface FakeBlockRunner : NSObject<ASBlockRunner>
@property(nonatomic, copy) void (^block)();

+ (id)blockRunner;

- (void) setQueue:(dispatch_queue_t)queue;
- (dispatch_queue_t)queue;

@end
