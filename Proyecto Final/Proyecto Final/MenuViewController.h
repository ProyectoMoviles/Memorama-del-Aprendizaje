//
//  MenuViewController.h
//  Proyecto Final
//
//  Created by Gilberto Garcia on 4/21/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property NSString *dificultad;
@property NSString *categoria;
@property NSNumber *cantidad;

- (IBAction)bsalir:(id)sender;
@end