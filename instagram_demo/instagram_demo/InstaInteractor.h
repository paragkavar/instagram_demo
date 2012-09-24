//
//  InstaInteractor.h
//  instagram_demo
//
//  Created by Администратор on 9/16/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *token;

@interface InstaInteractor : NSObject

+(NSString *) token;
+(void) setToken:(NSString *)newToken;

+(void) getFeed;
+(BOOL) changeLike:(int)mediaId;

@end
