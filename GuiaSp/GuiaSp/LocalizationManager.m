//
//  LocalizationManager.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "LocalizationManager.h"

@implementation LocalizationManager

-(instancetype) init
{
    return self;
}

+(LocalizationManager *) instance
{
    static LocalizationManager *sharedLoc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedLoc = [[self alloc] init];
                  });
    return sharedLoc;
}

-(NSString *) getRegion
{
 NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    return language;
}

@end
