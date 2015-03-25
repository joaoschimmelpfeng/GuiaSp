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
    pickerData = @[@"Bar/Balada",@"Teatro", @"Museu"];
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



- (IBAction)enviar:(id)sender {
    
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;        // Required to invoke mailComposeController when send
        NSString *messageBody;
        
        
        if ((text2.text ==nil)&&(text1.text==nil)) {
            return;
        }else{
            messageBody = (@" Nome : %@ /n Email: %@",text1.text,text2.text);

        }
        
        [mailCont setSubject:@"Anuncio"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"fehsb@hotmail.com"]];
        [mailCont setMessageBody:messageBody isHTML:NO];
        
        [self presentViewController:mailCont animated:YES completion:nil];
    }
    
    UIAlertView *confirmacaoAnucio = [[UIAlertView alloc] initWithTitle:@"GuiaSP" message:@"Obrigado por anunciar conosco." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [confirmacaoAnucio show];
    text1.text =@"";
    text2.text =@"";

    
}
@end
