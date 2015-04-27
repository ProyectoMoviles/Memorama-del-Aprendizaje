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

//texto a adivinar
@property (weak, nonatomic) IBOutlet UILabel *lblAdivina;

//todo el collection view
@property (weak, nonatomic) IBOutlet UICollectionView *collViewMatrizImagenes;

//método de bombita
- (IBAction)presionoOportunidad:(id)sender;

//variables de la matriz de objetos
@property (strong, nonatomic)NSMutableArray *Matriz;
@property (strong, nonatomic)NSDictionary *elemMatriz;
@property (nonatomic)NSInteger cantidadElem;
@property (strong, nonatomic) NSMutableArray *matrizFiltrada;

//Parametros para matriz de dificultad y categoría
@property NSString *dificultad;
@property NSString *categoria;
@property NSNumber *cantidad;

//Variables del tiempo
@property (weak, nonatomic) IBOutlet UILabel *lblTiempoJuego;
@property (strong,nonatomic) NSTimer *myTicker;

@property NSInteger tiempoIniciaPalabra;
@property NSInteger tiempoAdivinaPalabra;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;


@end