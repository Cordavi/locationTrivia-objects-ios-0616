//
//  FISLocation.h
//  locationTrivia-Objects
//
//  Created by Michael Amundsen on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISTrivium.h"

@interface FISLocation : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property(strong, nonatomic) NSMutableArray *trivia;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude;
- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length;
- (BOOL)hasValidData;
- (FISTrivium *)triviumWithMostLikes;

@end
