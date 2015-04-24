//
//  LocalizationManager.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalizationManager : NSObject
-(instancetype) init;
-(NSString *) getRegion;
+(LocalizationManager *) instance;
@end
