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
#import "TabBarController.h";
#import <Parse/Parse.h>

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize objetos,locMan;

- (void)viewDidLoad {
    locMan = [LocalizationManager instance];
    objetos = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"locais"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
     for (PFObject *e in objects)
     {
      [objetos addObject:e];
         [self.tableView reloadData];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
