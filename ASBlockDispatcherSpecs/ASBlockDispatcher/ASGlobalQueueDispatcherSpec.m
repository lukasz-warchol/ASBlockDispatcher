#import <Cedar-iOS/SpecHelper.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ASGlobalQueueDispatcher.h"

SPEC_BEGIN(ASGlobalQueueDispatcherSpec)

describe(@"ASGlobalQueueDispatcher", ^{
    __block ASGlobalQueueDispatcher *dispatcher;

    beforeEach(^{
        dispatcher = [ASGlobalQueueDispatcher dispatcher];
    });

    it(@"instace of dispatcher should be subclass of ASSimpleBlockDispatcher", ^void() {
        expect(dispatcher).toBeKindOf([ASSimpleBlockDispatcher class]);
    });

    describe(@"when creating deafult dispatcher", ^{
        it(@"should have global dispatch queue of defaut priority", ^void() {
            expect(dispatcher.queue).toEqual(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
        });
    });
    describe(@"when creating with spcified priority", ^{
        it(@"should have dispatch queue HIGH priority", ^{
            ASGlobalQueueDispatcher *dispatcher2 = [ASGlobalQueueDispatcher dispatcherWithPriority:DISPATCH_QUEUE_PRIORITY_HIGH];

            expect(dispatcher2.queue).toEqual(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));
        });

        it(@"should have dispatch queue LOW priority", ^{
            ASGlobalQueueDispatcher *dispatcher2 = [ASGlobalQueueDispatcher dispatcherWithPriority:DISPATCH_QUEUE_PRIORITY_LOW];

            expect(dispatcher2.queue).toEqual(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0));
        });

        it(@"should have dispatch queue BACKGROUND priority", ^{
            ASGlobalQueueDispatcher *dispatcher2 = [ASGlobalQueueDispatcher dispatcherWithPriority:DISPATCH_QUEUE_PRIORITY_BACKGROUND];

            expect(dispatcher2.queue).toEqual(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0));
        });
    });
});

SPEC_END
