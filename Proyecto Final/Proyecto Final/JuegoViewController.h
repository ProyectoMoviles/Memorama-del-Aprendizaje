//
//  JuegoViewController.h
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/26/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "celda.h"

@interface JuegoViewController : UIViewController <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *lblAdivina;

@property (weak, nonatomic) IBOutlet UICollectionView *collViewMatrizImagenes;
- (IBAction)presionoOportunidad:(id)sender;

@property (strong, nonatomic)NSMutableArray *Matriz;
@property (strong, nonatomic)NSDictionary *elemMatriz;
@property (nonatomic)NSInteger cantidadElem;
@property (strong, nonatomic) NSMutableArray *matrizFiltrada;

@property NSString *dificultad;
@property NSString *categoria;
@property NSNumber *cantidad;

@end