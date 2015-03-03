//
//  TabBarController.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController

@property UILabel *nome;
@property UILabel *categoria;
@property UIScrollView *scrollImages;
@property UITextView *desc;
@property UILabel *funcionamento;
@property UILabel *preco;
@property NSNumber *latitude;
@property NSNumber *longitude;

@end
