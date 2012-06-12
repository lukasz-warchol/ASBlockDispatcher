//
//  Created by Lukasz Warchol on 6/12/12.
//


@protocol ASBlockRunner <NSObject>
- (void) runBlock:(void(^)(void))block onQueue:(dispatch_queue_t)queue;
@end
