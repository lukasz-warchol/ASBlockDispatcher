//
//  Created by Lukasz Warchol on 5/12/12.
//

#import <Foundation/Foundation.h>

@protocol ASBlockDispatcher <NSObject>

- (void) dispatchSyncBlock:(void(^)(void))block;
- (void) dispatchAsyncBlock:(void(^)(void))block;

@end
