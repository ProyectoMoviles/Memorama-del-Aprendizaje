//
//  ViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *lDificultad;
@property (strong, nonatomic) IBOutlet UIPickerView *lCategoria;

- (IBAction)presionoJuega:(id)sender;
@end

