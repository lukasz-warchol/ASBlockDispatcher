#import <Cedar-iOS/SpecHelper.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ASCurrentQueueBlockDispatcher.h"

SPEC_BEGIN(ASCurrentQueueBlockDispatcherSpec)

describe(@"ASCurrentQueueBlockDispatcher", ^{
    __block ASCurrentQueueBlockDispatcher *dispatcher;

    beforeEach(^{
        dispatcher = [ASCurrentQueueBlockDispatcher dispatcher];
    });

    describe(@"when dispatching block synchronously", ^{
        it(@"should run immediately", ^void() {
            __block BOOL wasRun = NO;
            [dispatcher dispatchSyncBlock:^void() {
                wasRun = YES;
            }];

            expect(wasRun).toBeTruthy();
        });

        it(@"should not crash when nil block passed", ^{
            [dispatcher dispatchSyncBlock:nil];

            //should not crash
        });
    });

    describe(@"when dispatching block asynchronously", ^{
        it(@"should run immediately", ^void() {
            __block BOOL wasRun = NO;
            [dispatcher dispatchAsyncBlock:^void() {
                wasRun = YES;
            }];

            expect(wasRun).Not.toBeTruthy();
            //not true because two queues re not synchronised and current queue does not wait for other one to return
        });

        it(@"should not crash when nil block passed", ^{
            [dispatcher dispatchAsyncBlock:nil];

            //should not crash
        });
    });
});

SPEC_END
