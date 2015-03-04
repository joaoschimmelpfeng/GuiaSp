//
//  DescView.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "DescView.h"
#import <Social/Social.h>
#import "LocalizationManager.h"

@interface DescView ()

@end

@implementation DescView

@synthesize dados,nome,desc,scrollImages,funcionamento,preco,locMan;

//ScrollView
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollImages.contentOffset.x / scrollView.frame.size.width;
    
    pageImages.currentPage = page;
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //ScrollView
    for (int i=0; i<4; i++) {
        
        UIImageView *imagens = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]]];
        
        imagens.frame = CGRectMake((i-1)*320, 0, 320, 460);
        
        [scrollImages addSubview:imagens];

    }
    
    scrollImages.delegate = self;
    scrollImages.contentSize = CGSizeMake(320*3, 460);
    scrollImages.pagingEnabled = YES;
    
    pageImages.numberOfPages=3;
    pageImages.currentPage = 0;
    
    //banco de dados
    locMan = [LocalizationManager instance];
    nome.text = dados[@"nome"];
    if([[locMan getRegion] isEqualToString:@"pt"])
    {
        desc.text = dados[@"desc"];
        funcionamento.text =[NSString stringWithFormat:@"Funcionamento: %@",dados[@"funcionamento"]];
        preco.text =[NSString stringWithFormat:@"Preco: %@",dados[@"preco"]];
    }
    else
    {
        desc.text = dados[@"descEng"];
        funcionamento.text =[NSString stringWithFormat:@"Funcionamento: %@",dados[@"funcionamentoEng"]];
        preco.text =[NSString stringWithFormat:@"Preco: %@",dados[@"precoEng"]];
    }
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
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

-(void)update:(PFObject *)idados
{
    dados = idados;
}

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

//ScrollView
-(void)scrollViewDidScroll:(UIScrollView *)sender {
    
// Update the page when more than 50% of the previous/next page is visible
    
CGFloat pageWidth = self.scrollImages.frame.size.width;
int page = floor((self.scrollImages.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
self.pageImages.currentPage = page;
    
    }
    
- (IBAction)mudarPag:(id)sender {
    
// update the scroll view to the appropriate page
    
int page = pageImages.currentPage;
    
CGRect frame;
frame.origin.x = self.scrollImages.frame.size.width * self.pageImages.currentPage;
frame.origin.y = 0;
frame.size = self.scrollImages.frame.size;
    
    [self.scrollImages scrollRectToVisible:frame animated:YES];
    
    }


@end
