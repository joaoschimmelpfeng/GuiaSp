//
//  ControleDB.h
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 02/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ControleDB : NSObject

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSMutableArray *arrayResults;
@property (nonatomic, strong) NSMutableArray *arrayColumnNames;

@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(instancetype)initWithDatabase:(NSString *)dbFilename;
-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;
-(NSArray *)loadDataFromDB:(NSString *)query;
-(void)executeQuery:(NSString *)query;


@end
