//
//  FISTrivium.h
//  locationTrivia-Objects
//
//  Created by Michael Amundsen on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISTrivium : NSObject
@property (strong, nonatomic) NSString *content;
@property (nonatomic) NSUInteger likes;

- (instancetype)init;
- (instancetype)initWithContent:(NSString *)content likes:(NSUInteger)likes;

@end
