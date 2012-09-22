//
//  InstaInteractor.m
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import "InstaInteractor.h"
#import "JSONKit.h"

@implementation InstaInteractor

+(NSString *) token{
    return token;
}

+(void) setToken:(NSString *)newToken{
    if (token != newToken) {
        [token release];
        token = [newToken copy];
    }
}

+(void) getFeed {
    NSString *mediaUrl = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/feed?access_token=%@", token];
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    NSURL *URL = [NSURL URLWithString:mediaUrl];
    [request setURL:URL];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if ([data length] > 0 && error == nil)
        {
            NSDictionary *resultsDictionary = [data objectFromJSONData];
        }
        else if ([data length] == 0 && error == nil)
        {
            NSLog(@"Nothing was downloaded");
        }
        else if (error != nil)
        {
            NSLog(@"There was an error %@", error);
        }
    }];
}

+(BOOL) changeLike:(int)mediaId{
    NSString *likesUrl = [NSString stringWithFormat:@"https://api.instagram.com/v1/media/%i/feed?access_token=%@", mediaId, token];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    NSURL *URL = [NSURL URLWithString:likesUrl];
    [request setURL:URL];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *resultDictionary = [data objectFromJSONData];
    
    BOOL mediaLiked = YES;
    
    if (mediaLiked){
        mediaLiked = NO;
    }
    else
    {
        mediaLiked = YES;
    }
    return mediaLiked;
}




@end
