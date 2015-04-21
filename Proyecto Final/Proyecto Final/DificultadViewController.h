//
//  ViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/24/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DificultadViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property NSString *dificultad;
@property (strong, nonatomic) IBOutlet UIPickerView *lDificultad;



@end