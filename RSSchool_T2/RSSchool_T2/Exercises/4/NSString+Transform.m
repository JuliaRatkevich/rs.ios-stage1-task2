#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSCharacterSet *lowerLettersSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    NSCharacterSet *lettersSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    NSCharacterSet *nonLetterSet = [lowerLettersSet invertedSet];
    NSString *lettersOnly = [[[self lowercaseString]
                              componentsSeparatedByCharactersInSet: nonLetterSet]
                             componentsJoinedByString:@""];
    
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString: lettersOnly];
    
    bool isPangram = ([lowerLettersSet isSupersetOfSet:stringSet] &&
                      [stringSet isSupersetOfSet:lowerLettersSet]);
    
    NSCharacterSet *vowelsSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
    
    NSArray<NSString *> *words = [self componentsSeparatedByString:@" "];
    
    NSMutableArray<NSString *> *transformedWords = [NSMutableArray new];
    for (NSString *word in words) {
        if (word.length == 0) {
            continue;
        }
        long count = 0;
        NSMutableString *transformedWord = [NSMutableString stringWithCapacity:word.length];
        for (int i = 0; i < word.length; i++) {
            unichar c = [word characterAtIndex:i];
            bool isVowel = [vowelsSet characterIsMember:tolower(c)];
            bool isConsonant = [lettersSet characterIsMember:tolower(c)] && !isVowel;
            bool toUpper = false;
            
            if (isPangram && isVowel) {
                count += 1;
                toUpper = true;
            }
            
            if (!isPangram && isConsonant) {
                count += 1;
                toUpper = true;
            }

            c = toUpper ? toupper(c) : c;
            
            [transformedWord appendFormat:@"%c", c];
        }
        
        [transformedWords addObject:
         [NSString stringWithFormat:@"%ld%@", count, transformedWord]];
    }
    
    [transformedWords sortWithOptions:NSSortStable usingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        unichar count1 = [obj1 characterAtIndex:0];
        unichar count2 = [obj2 characterAtIndex:0];
        return count1 <= count2 ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    return [transformedWords componentsJoinedByString:@" "];
}
@end
