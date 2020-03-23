#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSInteger hourInt = [hours integerValue];
    NSInteger minuteInt = [minutes integerValue];
    
    if (hourInt > 12 || hourInt < 0) {
        return @"";
    }
    
    if (minuteInt >= 60 || minuteInt < 0) {
        return @"";
    }
    
    NSString *toPast = minuteInt >= 1 && minuteInt <= 30 ? @"past" : @"to";
    
    if (minuteInt > 30) {
        minuteInt = 60 - minuteInt;
        hourInt += 1;
    }
    
    NSString *specialMinute = [self specialMinute:minuteInt];
    NSString *hourString = [self numberToString:hourInt];
    if (minuteInt == 0) {
        return [NSString stringWithFormat:@"%@ %@", hourString, specialMinute];
    }
    
    NSString *mins = minuteInt > 1 ? @"minutes" : @"minute";
    
    NSString *minuteString = specialMinute ? specialMinute :
    [NSString stringWithFormat:@"%@ %@", [self numberToString:minuteInt], mins];
    
    return [NSString stringWithFormat:@"%@ %@ %@", minuteString, toPast, hourString];
}

- (NSString *)specialMinute:(NSInteger)number {
    NSDictionary *special = @{
                              @0: @"o' clock",
                              @15: @"quarter",
                              @30: @"half",
                              };
    
    return special[@(number)];
}

- (NSString *)numberToString:(NSInteger)number {
    NSDictionary *before20 = @{
                               @1: @"one",
                               @2: @"two",
                               @3: @"three",
                               @4: @"four",
                               @5: @"five",
                               @6: @"six",
                               @7: @"seven",
                               @8: @"eight",
                               @9: @"nine",
                               @10: @"ten",
                               @11: @"eleven",
                               @12: @"twelve",
                               @13: @"thirteen",
                               @14: @"fourteen",
                               @15: @"fifteen",
                               @16: @"sixteen",
                               @17: @"seventeen",
                               @18: @"eighteen",
                               @19: @"nineteen",
                               };
    
    NSDictionary *after20 = @{
                               @2: @"twenty",
                               @3: @"thirty",
                               @4: @"fourty",
                               @5: @"fivty",
                               @6: @"sixty",
                               };

    if (number < 20) {
        return before20[@(number)];
    }
    
    NSString *tenComponent = after20[@(number / 10)];
    NSString *digit = before20[@(number % 10)];
    
    return [NSString stringWithFormat:@"%@ %@", tenComponent, digit];
    
}

@end
