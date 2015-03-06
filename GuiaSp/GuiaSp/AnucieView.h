//
//  AnucieView.h
//  GuiaSp
//
//  Created by Fernando on 3/6/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnucieView : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property NSArray *pickerData;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)enviar:(id)sender;


@end
