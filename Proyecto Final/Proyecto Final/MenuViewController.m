//
//  MenuViewController.m
//  Proyecto Final
//
//  Created by Gilberto Garcia on 4/21/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "MenuViewController.h"
#import "JuegoViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bsalir:(id)sender {
    exit(0);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"reiniciar"]) {
        
        JuegoViewController *controller = [[[segue destinationViewController]viewControllers]objectAtIndex:0];
        
        controller.categoria = self.categoria;
        controller.dificultad = self.dificultad;
        controller.cantidad = self.cantidad;
    }
}
@end