//
//  TableViewController.h
//  GuiaSp
//
//  Created by Amanda Guimaraes Campos on 02/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalizationManager.h"

@interface TableViewController : UITableViewController

@property NSMutableArray *objetos;
@property LocalizationManager *locMan;
@property NSString *categoria;
@end
