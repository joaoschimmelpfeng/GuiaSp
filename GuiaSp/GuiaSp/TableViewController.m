//
//  TableViewController.m
//  GuiaSp
//
//  Created by Amanda Guimaraes Campos on 02/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "TableViewController.h"
#import "LocalizationManager.h"
#import "TableViewCell.h"
#import "TabBarController.h"
#import <Parse/Parse.h>

@interface TableViewController ()
{
    UIView *viewSub;
}

@end

@implementation TableViewController
@synthesize objetos,categoria,locMan,spinner;

- (void)viewDidLoad
{
    viewSub = [[UIView alloc]init];
    [viewSub setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
    viewSub.frame = self.view.frame;
    [self.view addSubview:viewSub];
    
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [spinner setCenter:viewSub.center];
    [viewSub addSubview:spinner];
    [spinner startAnimating];
    
    
    
    locMan = [LocalizationManager instance];
    objetos = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"locais"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
     for (PFObject *e in objects)
     {
      if([e[@"categoria"] isEqualToString:categoria])
      {
       [objetos addObject:e];
       [self.tableView reloadData];
      }
     }
    }];

    NSLog(@"%i",[objetos count]);
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [objetos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celula" forIndexPath:indexPath];
    [cell update:[objetos objectAtIndex:[indexPath row]]];
    [spinner stopAnimating];
    [spinner hidesWhenStopped];
    [spinner removeFromSuperview];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"toTabBar"])
    {
        NSIndexPath *num = [self.tableView indexPathForSelectedRow];
        TabBarController *sView = segue.destinationViewController;
        sView.dados = [objetos objectAtIndex:[num row]];
        [sView update];
    }
}

@end
