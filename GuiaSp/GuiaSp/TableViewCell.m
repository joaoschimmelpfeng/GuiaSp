//
//  TableViewCell.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 03/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "TableViewCell.h"
#import <Parse/Parse.h>

@implementation TableViewCell
@synthesize nome,categoria,bdData;

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void) update:(PFObject *)objeto;
{
    bdData = objeto;
    nome.text = objeto[@"nome"];
    categoria.text = objeto[@"desc"];;
}

@end
