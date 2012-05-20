#import <Cedar-iOS/SpecHelper.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import "ASMainQueueBlockDispatcher.h"

SPEC_BEGIN(ASMainQueueBlockDispatcherSpec)

describe(@"ASMainQueueBlockDispatcher", ^{
    __block ASMainQueueBlockDispatcher *dispatcher;

    beforeEach(^{
        dispatcher = [ASMainQueueBlockDispatcher dispatcher];
    });

    describe(@"when creating instance of dispatcher", ^{
        it(@"should be subclass of ASSimpleBlockDispatcher", ^void() {
            expect(dispatcher).toBeKindOf([ASSimpleBlockDispatcher class]);
        });

        it(@"should have main queue set as dispatch queue", ^{
            expect(dispatcher.queue).toEqual(dispatch_get_main_queue());
        });
    });
});

SPEC_END
