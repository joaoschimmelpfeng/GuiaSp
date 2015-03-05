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

@interface DescView : UIViewController <UIScrollViewDelegate> {
    
        
        UIPageControl *pageImages;
        UIScrollView *scrollImages;
        NSArray *imagens;
    
}


@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *categoria;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollImages;
@property (retain, nonatomic) IBOutlet UIPageControl *pageImages;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UILabel *funcionamento;
@property (weak, nonatomic) IBOutlet UILabel *preco;
@property LocalizationManager *locMan;
@property PFObject *dados;
@property UIImage *img1;
@property UIImage *img2;
@property UIImage *img3;
-(void)update:(PFObject *)idados;
- (IBAction)compartilharFace:(id)sender;
- (IBAction)compartilharTwitter:(id)sender;
- (IBAction)mudarPag:(id)sender;

@end
