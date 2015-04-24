//
//  ViewController.h
//  GuiaSp
//
//  Created by Amanda Guimaraes Campos on 02/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIScrollView *imagensScroll;
    UIPageControl *imagensPage;
}

@property (retain, nonatomic) IBOutlet UIScrollView *imagensScroll;
@property (retain, nonatomic) IBOutlet UIPageControl *imagensPage;

@end
