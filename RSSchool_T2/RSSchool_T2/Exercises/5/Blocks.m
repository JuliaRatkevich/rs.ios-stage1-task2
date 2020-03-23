#import "Blocks.h"

@implementation Blocks

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.blockA = ^(NSArray *array) {
            
        };
        
        self.blockB = ^(Class class) {
            
        };
        
        self.blockC = ^(NSObject *result) {
            
        };
    }
    return self;
}

@end

