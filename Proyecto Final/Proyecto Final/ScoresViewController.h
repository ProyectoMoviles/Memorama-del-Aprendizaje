//
//  ScoresViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/26/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoresViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lblOportunidades;
@property (weak, nonatomic) IBOutlet UILabel *lblTiempo;
@property (strong, nonatomic) IBOutlet UIButton *btmenu;
@property NSString *dificultad;
@property NSString *categoria;
@property NSNumber *cantidad;
@property Boolean *menuFlag;
@end