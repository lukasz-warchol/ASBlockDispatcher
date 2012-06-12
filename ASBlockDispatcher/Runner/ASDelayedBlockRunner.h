//
//  Created by Lukasz Warchol on 6/12/12.
//


#import <Foundation/Foundation.h>
#import "ASBlockRunner.h"


@interface ASDelayedBlockRunner : NSObject<ASBlockRunner>
@property(nonatomic) NSTimeInterval delay;

+ (id) blockRunnerWithDelayTime:(NSTimeInterval)delay;

@end
