//
//  ViewController.m
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "CategoriaViewController.h"
#import "JuegoViewController.h"

@interface CategoriaViewController ()
{
    NSArray *arregloCategoria;
    NSInteger n1;
}
@end

@implementation CategoriaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.actIndicator.hidden = true;
    
    //plist path
    NSString *pathPlist = [ [NSBundle mainBundle] pathForResource: @"Categorias" ofType: @"plist"];
    arregloCategoria = [[NSArray alloc] initWithContentsOfFile: pathPlist];
    
    // Data Connect
    self.lCategoria.dataSource = self;
    self.lCategoria.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arregloCategoria.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSDictionary *object = arregloCategoria[row];
    return [object objectForKey: @"Nombre"];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.bjugar.hidden = true;
    self.lcategoria.hidden = true;
    self.lCategoria.hidden = true;
    self.actIndicator.hidden = false;
    if ([[segue identifier] isEqualToString:@"catSegue"]) {

        JuegoViewController *controller = [[[segue destinationViewController]viewControllers]objectAtIndex:0];
        
        n1 = [self.lCategoria selectedRowInComponent:0];
        NSDictionary *object = arregloCategoria[n1];
        self.categoria = [object objectForKey: @"ID"];
        controller.categoria = self.categoria;
        controller.dificultad = self.dificultad;
        controller.cantidad = self.cantidad;
    }
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSDictionary *object = arregloCategoria[row];
    NSString *title = [object objectForKey: @"Nombre"];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return attString;
}
@end