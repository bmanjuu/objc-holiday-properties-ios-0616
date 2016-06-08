//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *supplies = [self.database[season][holiday] mutableCopy];
    
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    NSArray *holidaysInSeason = [self holidaysInSeason:season];
    
    for(NSString *holidays in holidaysInSeason){
        if([holidays isEqualToString:holiday]){
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    NSArray *suppliesAvailable = [self suppliesInHoliday:holiday inSeason:season];
    
    for(NSString *supplies in suppliesAvailable){
        if([supplies isEqualToString:supply]){
            return YES;
        }
    }
    
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday] = [[NSMutableArray alloc] init];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply]; 
    
    // no return
}

@end
