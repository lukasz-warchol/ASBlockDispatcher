//
//  Created by Lukasz Warchol on 5/12/12.
//

#import <UIKit/UIKit.h>
#import "ASBlockDispatcher.h"

@protocol ASBlockRunner;

@interface ASSimpleBlockDispatcher : NSObject<ASBlockDispatcher>
@property(nonatomic, retain) id<ASBlockRunner> blockRunner;

- (void) setQueue:(dispatch_queue_t)queue;
- (dispatch_queue_t)queue;

+ (id) dispatcherWithQueue:(dispatch_queue_t)queue;

@end
