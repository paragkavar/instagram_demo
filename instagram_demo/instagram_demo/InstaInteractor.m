//
//  InstaInteractor.m
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import "InstaInteractor.h"
#import "JSONKit.h"

NSDictionary *sharedDictionary;

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
    NSString *mediaUrl = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/media/recent/?access_token=%@", token];
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    
    NSURL *URL = [NSURL URLWithString:mediaUrl];
    [request setURL:URL];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary *dict = [jsonData objectFromJSONData];
    
    NSLog(@"Dict size %u", [dict count]);
    
    NSArray *images = [dict objectForKey:@"images"];
    
    NSString *imageOne = [images objectAtIndex:0];
    NSLog(@"Image eq %@", imageOne);
}

+(BOOL) changeLike:(int)mediaId{
    NSString *likesUrl = [NSString stringWithFormat:@"https://api.instagram.com/v1/media/%i/feed?access_token=%@", mediaId, token];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    NSURL *URL = [NSURL URLWithString:likesUrl];
    [request setURL:URL];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    [request release];
    
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
