//
//  ViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriaViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property NSString *dificultad;
@property NSString *categoria;
@property (strong, nonatomic) IBOutlet UIPickerView *lCategoria;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actIndicator;
@property (weak, nonatomic) IBOutlet UIButton *bjugar;
@property (weak, nonatomic) IBOutlet UILabel *lcategoria;


@end