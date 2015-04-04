//
//  ViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lmain;
@property (weak, nonatomic) IBOutlet UIButton *bjugar;
@property (weak, nonatomic) IBOutlet UIButton *baceptar;

@property (strong, nonatomic) IBOutlet UIPickerView *lDificultad;
- (IBAction)presionoJuega:(id)sender;
- (IBAction)presionoAceptar:(id)sender;
@end