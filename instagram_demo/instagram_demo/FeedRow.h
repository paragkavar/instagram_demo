//
//  FeedRow.h
//  instagram_demo
//
//  Created by Администратор on 9/22/12.
//  Copyright (c) 2012 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#define IMAGE_LOADED_NOTIFICATION @"imageLoaded"

@interface FeedRow : NSObject{
    UIImage * m_image;
}

@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSURL *imageUrl;
@property (nonatomic, readonly) UIImage *image;

-(void) loadImage;
-(void) loadImageInBackground;

+(FeedRow *) feedRowWithDescription:(NSString*)rowDescription;
+(FeedRow *) feedRowWithDescription:(NSString *)rowDescription imageUrl: (NSURL*) imageURL;

-(id) initWithDescription:(NSString*) rowDescription;
-(id) initWithDescription:(NSString *)rowDescription imageUrl: (NSURL*) imageURL;

@end
