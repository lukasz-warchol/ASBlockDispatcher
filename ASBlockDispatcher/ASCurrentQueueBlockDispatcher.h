//
//  Created by Lukasz Warchol on 5/12/12.
//

#import <UIKit/UIKit.h>
#import "ASBlockDispatcher.h"

@protocol ASBlockRunner;

@interface ASCurrentQueueBlockDispatcher : NSObject<ASBlockDispatcher>
@property(nonatomic, retain) id<ASBlockRunner> blockRunner;

+ (id) dispatcher;

@end
