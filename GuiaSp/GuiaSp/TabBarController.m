//
//  TabBarController.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "TabBarController.h"
#import "LocalizationManager.h"
#import <Parse/Parse.h>

@interface TabBarController ()

@end

@implementation TabBarController
@synthesize nome,categoria,scrollImages,desc,funcionamento,preco,latitude,longitude, dados,locMan;

- (void)viewDidLoad
{
    [super viewDidLoad];
    locMan = [LocalizationManager instance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void) update
{
    nome.text = dados[@"nome"];
    if([[locMan getRegion] isEqualToString:@"pt"])
    {
        desc.text = dados[@"desc"];
    }
    else
    {
        desc.text = dados[@"descEng"];
    }
}

@end
