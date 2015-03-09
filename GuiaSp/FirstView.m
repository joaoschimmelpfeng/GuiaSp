//
//  FirstView.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 05/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "FirstView.h"
#import "TableViewController.h"

@interface FirstView ()


@end

@implementation FirstView



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"museu"])
    {
        TableViewController *sView = segue.destinationViewController;
        sView.categoria = @"Museu";
        return;
    }
    
    if([[segue identifier] isEqualToString:@"bar"])
    {
        TableViewController *sView = segue.destinationViewController;
        sView.categoria = @"Bar";
        return;
    }
    
    if([[segue identifier] isEqualToString:@"teatro"])
    {
        TableViewController *sView = segue.destinationViewController;
        sView.categoria = @"Teatro";
        return;
    }
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

@end
