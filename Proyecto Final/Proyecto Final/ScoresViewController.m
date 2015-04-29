//
//  ScoresViewController.m
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/26/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "ScoresViewController.h"

@interface ScoresViewController ()

@end

@implementation ScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *filePath = [self scoreFilePath];
    
    NSString *plistPath = [ [NSBundle mainBundle] pathForResource: @"Scores" ofType: @"plist"];
    
    NSMutableDictionary *score = [NSMutableDictionary alloc];
    
    //Revisa si el plist ya existe en la carpeta de datos o si se tiene que guardar
    if ([[NSFileManager defaultManager] fileExistsAtPath: filePath]){
        score = [score initWithContentsOfFile: filePath];
        NSLog(@"Ya existe");
    }
    else{
        score = [score initWithContentsOfFile: plistPath];
        [score writeToFile: filePath atomically: YES];
        NSLog(@"No existe todavia");
    }
    
    self.lblScore.text = [[score objectForKey:@"Puntaje"]stringValue];
    self.lblOportunidades.text = [[score objectForKey:@"Oportunidades"]stringValue];
    self.lblTiempo.text = [[score objectForKey:@"Tiempo Finalizado"]stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) scoreFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains ( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex: 0];
    return [documentsDirectory stringByAppendingPathComponent:@"Scores.plist"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
