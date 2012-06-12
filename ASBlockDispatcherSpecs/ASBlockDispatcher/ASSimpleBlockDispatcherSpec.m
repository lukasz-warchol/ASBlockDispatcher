#import <Cedar-iOS/SpecHelper.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ASSimpleBlockDispatcher.h"
#import "FakeBlockRunner.h"

SPEC_BEGIN(ASSimpleBlockDispatcherSpec)

describe(@"ASSimpleBlockDispatcher", ^{
    __block dispatch_queue_t queue;
    __block ASSimpleBlockDispatcher *dispatcher;

    beforeEach(^{
        queue = dispatch_queue_create("test.dummy", 0);
        dispatcher = [ASSimpleBlockDispatcher dispatcherWithQueue:queue];
    });

    describe(@"after initialisation with queue", ^{
        it(@"should have queue set", ^{
            expect(dispatcher.queue).toEqual(queue);
        });
    });

    describe(@"when setting dispatch queue", ^{
        it(@"should not fail", ^void() {
            dispatch_queue_t testQueue = dispatch_queue_create("test.dummy.2", 0);
            dispatcher.queue = testQueue;
            dispatch_release(testQueue);
            BOOL equal = dispatcher.queue == testQueue;
            expect(equal).toBeTruthy();
        });

        it(@"should not fail when setting NULL queue", ^void() {
            dispatcher.queue = nil;
            expect(dispatcher.queue).toBeNil();
        });
    });

    describe(@"when running block", ^{
        it(@"should run block on specified queue", ^{
            __block BOOL queueIsCorrect = NO;
            [dispatcher dispatchBlock:^void() {
                queueIsCorrect = dispatch_get_current_queue() == queue;
            }];
            expect(queueIsCorrect).toBeTruthy();
        });

        it(@"should not crash on nil block", ^{
            [dispatcher dispatchBlock:nil];
        });

        context(@"and specified queue is current queue", ^{
            it(@"should not deadlock", ^{
                dispatcher.queue = dispatch_get_current_queue();
                __block BOOL wasRun = NO;
                [dispatcher dispatchBlock:^void() {
                    wasRun = YES;
                }];
                expect(wasRun).toBeTruthy();
            });
        });

        it(@"should use block runner", ^{
            FakeBlockRunner* blockRunner = [FakeBlockRunner blockRunner];
            dispatcher.blockRunner = blockRunner;

            dispatcher.queue = dispatch_get_global_queue(2, 0);
            void (^Block)() = ^void() {};
            [dispatcher dispatchBlock:Block];

            expect(blockRunner.block == Block).toBeTruthy();
            expect(blockRunner.queue == dispatcher.queue).toBeTruthy();
        });
    });

});

SPEC_END
