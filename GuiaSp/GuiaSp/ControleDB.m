//
//  ControleDB.m
//  GuiaSp
//
//  Created by João Vitor dos Santos Schimmelpfeng on 02/03/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "ControleDB.h"
#import <sqlite3.h>

@implementation ControleDB

-(instancetype)initWithDatabase
{
    self = [super init];
    self.documentsDirectory = [[NSBundle mainBundle] pathForResource:@"dbsp" ofType:@"SQLite"];
    
    return self;
}

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable
{
    // Criar a base SQLite.
    sqlite3 *sqlite3Database;
    
    NSString *databasePath = self.documentsDirectory;
    
    //Array de resultados.
    if (self.arrayResults != nil) {
        [self.arrayResults removeAllObjects];
        self.arrayResults = nil;
    }
    self.arrayResults = [[NSMutableArray alloc] init];
    
    // Iniciar a array de nomes das colunas.
    if (self.arrayColumnNames != nil) {
        [self.arrayColumnNames removeAllObjects];
        self.arrayColumnNames = nil;
    }
    self.arrayColumnNames = [[NSMutableArray alloc] init];
    
    
    // Abrir database.
    BOOL openDatabaseResult = sqlite3_open([databasePath UTF8String], &sqlite3Database);
    if(openDatabaseResult == SQLITE_OK) {
        
        
        // .
        sqlite3_stmt *compiledStatement;
        
        // Carregar toda informação da db.
        BOOL prepareStatementResult = sqlite3_prepare_v2(sqlite3Database, query, -1, &compiledStatement, NULL);
        if(sqlite3_prepare_v2(sqlite3Database, query, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            
            // Checar se a query é executavel.
            if (!queryExecutable){
                
                NSMutableArray *arrDataRow;
                
                // Percorra o loop adicionando os resultados a array de linha.
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                    // Inicializar a array que vai ter os dados adquiridos do processo.
                    arrDataRow = [[NSMutableArray alloc] init];
                    
                    // Pegar o total de colunas.
                    int totalColumns = sqlite3_column_count(compiledStatement);
                    
                    // Ande todas as colunas analisando os dados.
                    for (int i=0; i<totalColumns; i++){
                        // Converte a data da array para char.
                        char *dbDataAsChars = (char *)sqlite3_column_text(compiledStatement, i);
                        
                        // se tiver dados no dbDataAsChars, adiciona ao array de data.
                        if (dbDataAsChars != NULL)
                        {
                            // Converter string.
                            [arrDataRow addObject:[NSString  stringWithUTF8String:dbDataAsChars]];
                        }
                        
                        // Manter o nome da coluna.
                        if (self.arrayColumnNames.count != totalColumns)
                        {
                            dbDataAsChars = (char *)sqlite3_column_name(compiledStatement, i);
                            [self.arrayColumnNames addObject:[NSString stringWithUTF8String:dbDataAsChars]];
                        }
                    }
                    
                    // Guardas os dados na array de resultados.
                    if (arrDataRow.count > 0) {
                        [self.arrayResults addObject:arrDataRow];
                    }
                }
            }
            else
            {
                NSInteger executeQueryResults = sqlite3_step(compiledStatement);
                if (executeQueryResults == SQLITE_DONE) {
                    // Manter as linhas afetadas.
                    self.affectedRows = sqlite3_changes(sqlite3Database);
                    
                    // Manter a ultima linha adicionada.
                    self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
                }
                else
                {
                    NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
                }
            }
        }
        else
        {
            NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
        }
        
        // Liberar o compledStatement da memoria.
        sqlite3_finalize(compiledStatement);
        
    }
    
    // fechar a database.
    sqlite3_close(sqlite3Database);
}

-(NSArray *)loadDataFromDB:(NSString *)query
{
    [self runQuery:[query UTF8String] isQueryExecutable:NO];
    return (NSArray *)self.arrayResults;
}

-(void)executeQuery:(NSString *)query
{
    [self runQuery:[query UTF8String] isQueryExecutable:YES];
}
@end
