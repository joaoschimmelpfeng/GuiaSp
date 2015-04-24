//
//  ViewController.m
//  GuiaSp
//
//  Created by Amanda Guimaraes Campos on 02/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imagensScroll, imagensPage;

- (void)viewDidLoad {
    
    for (int i =0; i<2; i++) {
        
        UIImageView *imagensUrl = [[UIImageView alloc]initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:@"http://msalx.vejasp.abril.com.br/2012/08/22/0020/RPss5/museu-do-ipiranga.jpeg?1348322048"]]]];
        
        
        [imagensScroll addSubview:imagensUrl];
        //[imagensScroll release];
        
    }
    
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


@end
