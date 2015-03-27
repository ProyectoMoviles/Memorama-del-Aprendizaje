//
//  JuegoViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/26/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JuegoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collviewMatrizJuego;
@property (weak, nonatomic) IBOutlet UILabel *lblAdivina;

- (IBAction)presionoOportunidad:(id)sender;
- (IBAction)presionoMenu:(id)sender;

@end
