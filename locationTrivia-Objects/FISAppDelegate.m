//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)allLocationNames {
    NSMutableArray *locationNames = [@[] mutableCopy];
    for (FISLocation *location in self.locations) {
        [locationNames addObject:location.name];
    }
    return locationNames;
}

- (FISLocation *)locationNamed:(NSString *)name {
    NSPredicate *locationPredicate = [NSPredicate predicateWithFormat:@"%@ == name", name];
    NSArray *filteredArray = [self.locations filteredArrayUsingPredicate:locationPredicate];
    return [filteredArray firstObject];
}

- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    CGFloat latitudeWithMarginAdded = latitude + margin;
    CGFloat longitudeWithMarginAdded = longitude + margin;
    CGFloat latitudeWithMarginSubtracted = latitude - margin;
    CGFloat longitudeWithMarginSubtracted = longitude - margin;
    NSMutableArray *locationsNearLatitude = [@[] mutableCopy];
    
    for (FISLocation *location in self.locations) {
        if ((location.latitude >= latitudeWithMarginSubtracted) && (location.latitude <= latitudeWithMarginAdded) && (location.longitude >=longitudeWithMarginSubtracted) && (location.longitude <= longitudeWithMarginAdded)) {
            [locationsNearLatitude addObject:location];
        }
    }
    return locationsNearLatitude;
}

@end
