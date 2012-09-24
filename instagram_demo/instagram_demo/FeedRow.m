//
//  FeedRow.m
//  instagram_demo
//
//  Created by Администратор on 9/22/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import "FeedRow.h"

@implementation FeedRow

@synthesize description, imageUrl;

-(id) initWithDescription:(NSString *)rowDescription {
    return [self initWithDescription:rowDescription imageUrl:nil];
}

-(id) initWithDescription:(NSString *)rowDescription imageUrl: (NSURL*) imageURL{
    self = [super init];
    self.description = rowDescription;
    self.imageUrl = imageURL;
    return self;}


+(FeedRow*) feedRowWithDescription:(NSString*)description {
    return [[[FeedRow alloc] initWithDescription:description] autorelease];
}
+(FeedRow*) feedRowWithDescription:(NSString *)description imageURL:(NSURL*)url {
    return [[[FeedRow alloc] initWithDescription:description imageUrl:url] autorelease];
}

-(void) dealloc {
    [m_image release];
    self.imageUrl = nil;
    self.description = nil;
    [super dealloc];
}

-(UIImage*) image {
    return m_image;
}

-(void) loadImage{
    [self performSelectorInBackground:@selector(loadImageInBackground) withObject:nil];
}

-(void) loadImageInBackground{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.imageUrl];
    NSError *error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if (error == nil)
    {
        [m_image release];
        m_image = [[UIImage imageWithData:data] retain];
        
        [[NSNotificationCenter defaultCenter]
            postNotificationName:IMAGE_LOADED_NOTIFICATION
         object:self];
    }
    
    [pool release];
    
}


@end
