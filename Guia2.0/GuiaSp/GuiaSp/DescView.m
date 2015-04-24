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
@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@end

@implementation DescView

@synthesize dados,nome,desc,scrollImages,funcionamento,preco,locMan,img1,img2,img3,scrollContent,latitude,longitude;

//ScrollView
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollImages.contentOffset.x / scrollView.frame.size.width;
    
    pageImages.currentPage = page;
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //Imagens do Scrollview.
    scrollImages.delegate = self;
    scrollImages.contentSize = CGSizeMake(360*3, 227);
    scrollImages.pagingEnabled = YES;
    
    pageImages.numberOfPages=3;
    pageImages.currentPage = 0;
    
    UIImageView *view1 = [[UIImageView alloc] init];
    [view1 setImage:img1];
    [scrollImages addSubview:view1];
    
    UIImageView *view2 = [[UIImageView alloc] init];
    [view1 setImage:img2];
    [scrollImages addSubview:view2];
    
    UIImageView *view3 = [[UIImageView alloc] init];
    [view1 setImage:img3];
    [scrollImages addSubview:view3];
    
    //banco de dados
    locMan = [LocalizationManager instance];
    nome.text = dados[@"nome"];
    if([[locMan getRegion] isEqualToString:@"pt"])
    {
        desc.text = dados[@"desc"];
        funcionamento.text =[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"operation", nil),dados[@"funcionamento"]];
        preco.text =[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"price", nil),dados[@"preco"]];
    }
    else
    {
        desc.text = dados[@"descEng"];
        funcionamento.text =[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"operation", nil),dados[@"funcionamentoEng"]];
        preco.text =[NSString stringWithFormat:@"%@: %@",NSLocalizedString(@"price", nil),dados[@"precoEng"]];
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
    latitude = dados[@"latitude"];
    longitude = dados[@"longitude"];
    
    PFFile *obj1 = dados[@"img1"];
    [obj1 getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error)
    {
        if (!error)
        {
            img1 = [UIImage imageWithData:imageData];
            UIImageView *Simagens = [[UIImageView alloc] initWithImage:img1];
            Simagens.frame = CGRectMake(0, 0,scrollImages.frame.size.width,scrollImages.frame.size.height);
            [scrollImages addSubview:Simagens];
        }
    }];
    
    obj1 = dados[@"img2"];
    [obj1 getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error)
     {
         if (!error)
         {
             img2 = [UIImage imageWithData:imageData];
             UIImageView *Simagens = [[UIImageView alloc] initWithImage:img2];
             
             Simagens.frame = CGRectMake(scrollImages.frame.size.width, 0,scrollImages.frame.size.width,scrollImages.frame.size.height);
             
             [scrollImages addSubview:Simagens];
         }
     }];
    
    obj1 = dados[@"img3"];
    [obj1 getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error)
     {
         if (!error)
         {
             img3 = [UIImage imageWithData:imageData];
             UIImageView *Simagens = [[UIImageView alloc] initWithImage:img3];
             Simagens.frame = CGRectMake(2*scrollImages.frame.size.width, 0,scrollImages.frame.size.width,scrollImages.frame.size.height);
             
             scrollImages.maximumZoomScale = Simagens.image.size.width / scrollImages.frame.size.width;
             scrollImages.zoomScale = 1.0;
             [scrollImages addSubview:Simagens];
         }
     }];
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
    
- (IBAction)mudarPag:(id)sender
{
    
// update the scroll view to the appropriate page
    
int page = pageImages.currentPage;
    
CGRect frame;
frame.origin.x = self.scrollImages.frame.size.width * self.pageImages.currentPage;
frame.origin.y = 0;
frame.size = self.scrollImages.frame.size;
    
    [self.scrollImages scrollRectToVisible:frame animated:YES];
    
    }

- (IBAction)TracaRota:(id)sender {
    NSString *urlString = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%@,%@",latitude,longitude];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}


@end
