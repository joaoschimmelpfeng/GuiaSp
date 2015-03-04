//
//  DescView.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LocalizationManager.h"

@interface DescView : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollImages;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UILabel *funcionamento;
@property (weak, nonatomic) IBOutlet UILabel *preco;
@property LocalizationManager *locMan;
@property PFObject *dados;
-(void)update:(PFObject *)idados;
- (IBAction)compartilharFace:(id)sender;
- (IBAction)compartilharTwitter:(id)sender;

@end
