//
//  AnucieView.m
//  GuiaSp
//
//  Created by Fernando on 3/6/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "AnucieView.h"

@interface AnucieView ()

@end

@implementation AnucieView
@synthesize pickerView,pickerData,text2,text1;

- (void)viewDidLoad {

    text1.delegate = self;
    text2.delegate = self;
    
    pickerData = @[@"Bar/Balada",NSLocalizedString(@"theater", nil),NSLocalizedString(@"museum", nil)];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (int) pickerData.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
  //  if (textField == text1){
     //   text2.
    //}
    [text1 resignFirstResponder];
    [text2 resignFirstResponder];
    return YES;
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
   
    
    UIAlertView *confirma = [[UIAlertView alloc] initWithTitle:@"GuiaSP" message:@"Obrigado, email enviado com sucesso!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    UIAlertView *erro = [[UIAlertView alloc] initWithTitle:@"GuiaSP Alerta" message:@"Ocorreu um erro no envio!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

    switch (result) {
        case MFMailComposeResultSent:

            [confirma show];

            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            
            [erro show];
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)enviar:(id)sender {
    
    UIAlertView *confirmacaoAnucio = [[UIAlertView alloc] initWithTitle:@"GuiaSP Alerta" message:@"Você não está logado no mail, Entre em contato através do endereço guiaspanuncio@gmail.com" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    

    
    if([MFMailComposeViewController canSendMail]) {
    
        NSString *messageBody;
      
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
//        
//        if ((text2.text ==nil)&&(text1.text==nil)) {
//            return;
//        }else{
            messageBody = (@" Estou interessado em anunciar meu negócio ...   ");

//        }
        
        [mailCont setSubject:@"Anuncio"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"guiaspanuncio@gmail.com"]];
        [mailCont setMessageBody:messageBody isHTML:NO];
        [self presentViewController:mailCont animated:YES completion:nil];
        
    }else{
        
     [confirmacaoAnucio show];
        
    }
    

    
//    [confirmacaoAnucio show];
//    text1.text =@"";
//    text2.text =@"";

    
}
@end
