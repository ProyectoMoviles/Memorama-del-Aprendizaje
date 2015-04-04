//
//  ViewController.m
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_dataDificultad;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bjugar.hidden = true;
    // Data Init
    _dataDificultad = @[@"Facil", @"Regular", @"Dificil"];
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
    return _dataDificultad.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _dataDificultad[row];
}

- (IBAction)presionoJuega:(id)sender {
}
- (IBAction)presionoAceptar:(id)sender {
    self.baceptar.hidden = true;
    self.bjugar.hidden = false;
    self.lmain.text = @"Categoria";
    _dataDificultad = @[@"Categoria 1", @"Categoria 2", @"Categoria 3"];
    // Data Connect
    self.lDificultad.dataSource = self;
    self.lDificultad.delegate = self;
}
@end