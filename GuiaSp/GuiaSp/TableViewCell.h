//
//  TableViewCell.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LocalizationManager.h"

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic)IBOutlet UIImageView *iconesTableView;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *categoria;
@property PFObject *bdData;
@property LocalizationManager *locMan;
-(void) update:(PFObject *)objeto;

@end
