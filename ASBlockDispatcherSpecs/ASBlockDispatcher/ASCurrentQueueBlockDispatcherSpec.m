#import <Cedar-iOS/SpecHelper.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ASCurrentQueueBlockDispatcher.h"
#import "FakeBlockRunner.h"

SPEC_BEGIN(ASCurrentQueueBlockDispatcherSpec)

describe(@"ASCurrentQueueBlockDispatcher", ^{
    __block ASCurrentQueueBlockDispatcher *dispatcher;

    beforeEach(^{
        dispatcher = [ASCurrentQueueBlockDispatcher dispatcher];
    });

    describe(@"when dispatching block", ^{
        it(@"should run immediately", ^void() {
            __block BOOL wasRun = NO;
            [dispatcher dispatchBlock:^void() {
                wasRun = YES;
            }];

            expect(wasRun).toBeTruthy();
        });

        it(@"should not crash when nil block passed", ^{
            [dispatcher dispatchBlock:nil];

            //should not crash
        });

        it(@"should use block runner", ^{
            FakeBlockRunner* blockRunner = [FakeBlockRunner blockRunner];
            dispatcher.blockRunner = blockRunner;

            void (^Block)() = ^void() {};
            [dispatcher dispatchBlock:Block];

            expect(blockRunner.block == Block).toBeTruthy();
            expect(blockRunner.queue == dispatch_get_current_queue()).toBeTruthy();
        });
    });

});

SPEC_END
