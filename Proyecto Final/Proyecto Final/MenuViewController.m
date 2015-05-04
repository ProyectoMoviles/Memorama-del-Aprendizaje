//
//  MenuViewController.m
//  Proyecto Final
//
//  Created by Gilberto Garcia on 4/21/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "MenuViewController.h"
#import "JuegoViewController.h"
#import "ScoresViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Menu";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bsalir:(id)sender {
    exit(0);
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"reiniciar"]) {
        
        JuegoViewController *controller = [[[segue destinationViewController]viewControllers]objectAtIndex:0];
        
        controller.categoria = self.categoria;
        controller.dificultad = self.dificultad;
        controller.cantidad = self.cantidad;
    }
    if ([[segue identifier] isEqualToString:@"scores"]) {
        
        ScoresViewController *controller = [segue destinationViewController];
        
        controller.menuFlag = true;
        controller.categoria = self.categoria;
        controller.dificultad = self.dificultad;
        controller.cantidad = self.cantidad;
    }
}

@end