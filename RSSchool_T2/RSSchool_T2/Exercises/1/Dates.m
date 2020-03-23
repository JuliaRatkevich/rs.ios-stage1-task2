#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"dd.MM.yyyy";
    NSString *dateString = [NSString stringWithFormat:@"%@.%@.%@", day, month, year];
    NSDate *date = [formatter dateFromString: dateString];
    if (date == nil) {
        return @"Такого дня не существует";
    }
    
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    formatter.dateFormat = @"dd MMMM, EEEE";
    
    NSString *result = [formatter stringFromDate:date];
    return result;
}

@end
