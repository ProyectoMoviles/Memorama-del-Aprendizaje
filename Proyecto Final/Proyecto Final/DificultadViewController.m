//
//  ViewController.m
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "DificultadViewController.h"
#import "JuegoViewController.h"

@interface DificultadViewController ()
{
    NSArray *arregloDifficultad;
    NSInteger n1;
}
@end

@implementation DificultadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //plist path
    NSString *pathPlist = [ [NSBundle mainBundle] pathForResource: @"Dificultades" ofType: @"plist"];
    arregloDifficultad = [[NSArray alloc] initWithContentsOfFile: pathPlist];
    
    // Data Connect
    self.lDificultad.dataSource = self;
    self.lDificultad.delegate = self;
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
    return arregloDifficultad.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSDictionary *object = arregloDifficultad[row];
    return [object objectForKey: @"Nombre"];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"difSegue"]) {
        JuegoViewController *controller = [segue destinationViewController];
        n1 = [self.lDificultad selectedRowInComponent:0];
        NSDictionary *object = arregloDifficultad[n1];
        self.dificultad = [object objectForKey: @"ID"];
        self.cantidad = [object objectForKey: @"Cantidad"];
        controller.dificultad = self.dificultad;
        controller.cantidad = self.cantidad;
    }
}

@end