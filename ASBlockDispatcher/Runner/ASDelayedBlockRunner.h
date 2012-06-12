//
//  Created by Lukasz Warchol on 6/12/12.
//


#import <Foundation/Foundation.h>


@interface ASDelayedBlockRunner : NSObject
@property(nonatomic) NSTimeInterval delay;

+ (id) blockRunnerWithDelayTime:(NSTimeInterval)delay;

@end
