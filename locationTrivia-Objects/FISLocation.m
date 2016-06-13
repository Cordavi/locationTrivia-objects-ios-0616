//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Michael Amundsen on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

- (instancetype)init {
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}

- (instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if ([self.name length] < length) {
        return self.name;
    } else if ([self.name length] > length) {
        self.name = [self.name substringToIndex:length];
        return self.name;
    }
    return @"";
}

- (BOOL)hasValidData {
    if ([self.name length] == 0) {
        return NO;
    } else if (!(self.latitude >= -90.0 && self.latitude <= 90.0)) {
        return NO;
    } else if (!(self.longitude > -180.0 && self.longitude <= 180.0)) {
        return NO;
    } else {
        return YES;
    }
}

- (FISTrivium *)triviumWithMostLikes {
    if ([self.trivia count] == 0) {
        return nil;
    }
    NSSortDescriptor *triviaWithHighestLikes = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    NSArray *triviaSorted = [self.trivia sortedArrayUsingDescriptors:[NSArray arrayWithObject:triviaWithHighestLikes]];
    return [triviaSorted firstObject];
}
@end
