//
//  AppDelegate.m
//  test1
//
//  Created by Ming-der Wang on 01/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import <PXAPI/PXAPI.h>

/*
 Go get your own key from 500px on http://500px.com/settings/applications?from=developers
 */

#define kUserNameForAuthentication  @"username"
#define kPasswordForAuthentication  @"password"

#define kPXAPIConsumerKey       @"wZHbWGA0R5MFkAGlc3eMfLeH8Jx7iuEuKzxZcECu"
#define kPXAPIConsumerSecret    @"7UTN19sJ3k1XVrPTiTXaXTJJKH6qyshb3TyRhDu2"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [PXRequest setConsumerKey:kPXAPIConsumerKey consumerSecret:kPXAPIConsumerSecret];
    
    PXAPIHelper *helper = [[PXAPIHelper alloc] initWithHost:nil
                                   consumerKey:kPXAPIConsumerKey
                                consumerSecret:kPXAPIConsumerSecret];
    
    NSDictionary *dictionary = [self jsonDictionaryForRequest:[helper urlRequestForSearchTerm:@"taipei"] expectingResponseCode:200];

#ifdef DEBUG
//    NSLog(@"%s|%@",__PRETTY_FUNCTION__,[dictionary objectForKey:@"photos"]);
#endif
    NSArray *items = [dictionary objectForKey:@"photos"];
    self.itemsArray = [NSMutableArray new];
    for (NSDictionary *item in items) {
        
#ifdef DEBUG
//    NSLog(@"%s|%@",__PRETTY_FUNCTION__,[item objectForKey:@"image_url"][0]);
#endif
        [self.itemsArray addObject:[item objectForKey:@"image_url"][0]];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

}


-(NSDictionary *)jsonDictionaryForRequest:(NSURLRequest *)urlRequest expectingResponseCode:(NSInteger)httpResponseCode
{
    NSHTTPURLResponse *returnResponse;
    NSError *connectionError;
    NSData *returnedData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&returnResponse error:&connectionError];
    
    if (connectionError)
    {
        NSLog(@"Connection returned error: %@", connectionError);
        return nil;
    }
    
    if (returnResponse.statusCode != httpResponseCode)
    {
        NSLog(@"Connection returned response code %d but we were expecting %d", returnResponse.statusCode, httpResponseCode);
        return nil;
    }
    
    NSError *jsonParseError;
    NSDictionary *returnedDictionary = [NSJSONSerialization JSONObjectWithData:returnedData options:0 error:&jsonParseError];
    
    return returnedDictionary;
}

@end