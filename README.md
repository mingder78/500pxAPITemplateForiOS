One API per Day Hands-on for iOS
(http://programmableweb4ios.blogspot.tw/)

Hope I can post a ProgrammableWeb listed API testing example for iOS, iphone, ipad per day, starting from Jan. 25, 2013.

I made 500px APIs run well on my iOS using XCode. Thanks for help from the example and library from github https://github.com/500px/500px-iOS-api (GEART!).

This is the major code segment for testing:
(you can only see result in NSLog not on app UI.)

#import <PXAPI/PXAPI.h>

#define kUserNameForAuthentication  @"your username"
#define kPasswordForAuthentication  @"your password"

#define kPXAPIConsumerKey       @"------J3k1XVrPTiTXaXTJJKH6qyshb3TyRhDu2"
#define kPXAPIConsumerSecret    @"------GA0R5MFkAGlc3eMfLeH8Jx7iuEuKzxZcECu"




    [PXRequest setConsumerKey:kPXAPIConsumerKey consumerSecret:kPXAPIConsumerSecret];
    
    PXAPIHelper *helper = [[PXAPIHelper alloc] initWithHost:nil
                                   consumerKey:kPXAPIConsumerKey
                                consumerSecret:kPXAPIConsumerSecret];



    NSDictionary *dictionary = [self jsonDictionaryForRequest:[helper urlRequestForSearchTerm:@"taipei101"] expectingResponseCode:200];

#ifdef DEBUG
    NSLog(@"%s|%@",__PRETTY_FUNCTION__,dictionary);
#endif


