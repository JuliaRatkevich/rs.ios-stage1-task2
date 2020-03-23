#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    if (b.length == 0) {
        return @"YES";
    }
    
    NSString *uppercaseA = [a uppercaseString];
    int j = 0;
    for (int i = 0; i < uppercaseA.length; i++) {
        if ([uppercaseA characterAtIndex:i] == [b characterAtIndex:j]) {
            j += 1;
        }
        
        if (j >= b.length) {
            return @"YES";
        }
    }
    
    return @"NO";
}
@end
