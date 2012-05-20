//
//  Created by Lukasz Warchol on 5/12/12.
//

#import <UIKit/UIKit.h>
#import "ASBlockDispatcher.h"

@interface ASCurrentQueueBlockDispatcher : NSObject<ASBlockDispatcher>

+ (id) dispatcher;

@end
