#import <Cedar-iOS/SpecHelper.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ASSimpleBlockDispatcher.h"

SPEC_BEGIN(ASSimpleBlockDispatcherSpec)

describe(@"ASSimpleBlockDispatcher", ^{
    __block dispatch_queue_t queue;
    __block ASSimpleBlockDispatcher *dispatcher;

    beforeEach(^{
        queue = dispatch_queue_create(@"test.dummy", 0);
        dispatcher = [ASSimpleBlockDispatcher dispatcherWithQueue:queue];
    });

    describe(@"after initialisation with queue", ^{
        it(@"should have queue set", ^{
            expect(dispatcher.queue).toEqual(queue);
        });
    });

    describe(@"when setting dispatch queue", ^{
        it(@"should not fail", ^void() {
            dispatch_queue_t testQueue = dispatch_queue_create(@"test.dummy.2", 0);
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

    describe(@"when running block synchronously", ^{
        it(@"should run block on specified queue", ^{
            __block BOOL queueIsCorrect = NO;
            [dispatcher dispatchSyncBlock:^void() {
                queueIsCorrect = dispatch_get_current_queue() == queue;
            }];
            expect(queueIsCorrect).toBeTruthy();
        });

        it(@"should not crash on nil block", ^{
            [dispatcher dispatchSyncBlock:nil];
        });

        context(@"and specified queue is current queue", ^{
            it(@"should not deadlock", ^{
                dispatcher.queue = dispatch_get_current_queue();
                __block BOOL wasRun = NO;
                [dispatcher dispatchSyncBlock:^void() {
                    wasRun = YES;
                }];
                expect(wasRun).toBeTruthy();
            });
        });
    });

    describe(@"when running block asynchronously", ^{
        it(@"should not crash on nil block", ^{
            [dispatcher dispatchAsyncBlock:nil];
        });

        it(@"should run asynchronously", ^{
            __block BOOL wasRun = NO;
            [dispatcher dispatchAsyncBlock:^void() {
                wasRun = YES;
            }];
            expect(wasRun).Not.toBeTruthy();
            //not true because two queues re not synchronised and current queue does not wait for other one to return
        });
    });

});

SPEC_END
