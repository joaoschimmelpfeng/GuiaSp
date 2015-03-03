//
//  DescView.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "DescView.h"
#import <Social/Social.h>

@interface DescView ()

@end

@implementation DescView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)compartilharFace:(id)sender {
    
    NSLog(@"Facebook post...");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        NSLog(@"Logado!");
        
        SLComposeViewController *seuPoste;
        
        seuPoste = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [seuPoste setInitialText:@"Estou indo para " "digite nome do local"];
        
        [self presentViewController:seuPoste animated:YES completion:nil];
        
    }
    
    else {
        UIAlertView *erro = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Você náo está conectado ao Facebook." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [erro show];
        
        
    }

}

- (IBAction)compartilharTwitter:(id)sender {
    
    NSLog(@"Twitter post...");
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        NSLog(@"Logado!");
        
        SLComposeViewController *seuPoste;
        
        seuPoste = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [seuPoste setInitialText:@"Estou indo para " "digite nome do local"];
        
        [self presentViewController:seuPoste animated:YES completion:nil];
        
    }
    
    else {
        UIAlertView *erro = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Você náo está conectado ao Twitter." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [erro show];
        
        
    }

}

@end
