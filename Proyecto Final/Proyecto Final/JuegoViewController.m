//
//  JuegoViewController.m
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/26/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "JuegoViewController.h"

@interface JuegoViewController ()

@end

@implementation JuegoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *pathPlist = [ [NSBundle mainBundle] pathForResource: @"Elementos" ofType: @"plist"];
    self.Matriz = [[NSMutableArray alloc] initWithContentsOfFile: pathPlist];
    self.cantidadElem = 0;
    self.matrizFiltrada = [[NSMutableArray alloc]init];
    
    /*NSArray *array = [self.elemMatriz objectForKey:@"IDCategoria"];
    for (int j = 0; j < [array count]; j++) {
        if ([[array objectAtIndex:j] isEqualToString:@"1"]) {
            self.cantidadElem++;
        }
    }*/
    
    for (int i = 0; i < self.Matriz.count; i++) {
        self.elemMatriz = self.Matriz[i];
        if ([[self.elemMatriz objectForKey:@"IDCategoria"]isEqualToString:@"1"]) {
            self.matrizFiltrada[self.cantidadElem] = self.elemMatriz;
            self.cantidadElem++;
        }
    }
    [self generaRandomSeleccion];
    
    /* Debugging */
    NSLog(@"%ld",(long)self.cantidadElem);
    NSLog(@"%ld",(long)self.Matriz.count);
    for (int i = 0; i<self.cantidadElem; i++) {
        NSString *nombre = [self.matrizFiltrada[i] objectForKey:@"Nombre"];
        NSLog(nombre);
    }

}

- (void) generaRandomSeleccion{
    NSInteger r = arc4random_uniform(self.matrizFiltrada.count);
    NSString *adivina = [self.matrizFiltrada[r] objectForKey:@"Nombre"];
    self.lblAdivina.text = adivina;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)presionoOportunidad:(id)sender {
}

- (IBAction)presionoMenu:(id)sender {
}


#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.matrizFiltrada.count;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    NSInteger cantidadCat = 1; //Poner la busqueda de categorias en el diccionario
    return cantidadCat;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    celda *cell = [cv dequeueReusableCellWithReuseIdentifier:@"elemento" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString *stringUrl = [self.matrizFiltrada[indexPath.row] objectForKey:@"ImgURL"];
    NSURL *nsurl = [NSURL URLWithString: stringUrl];
    NSData *data = [[NSData alloc]initWithContentsOfURL: nsurl];
    UIImage *imagen = [UIImage imageWithData: data];
    cell.imgCelda.image = imagen;
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *textoPicado = [self.matrizFiltrada[indexPath.row] objectForKey:@"Nombre"];
    // Falta implementar el metodo de selecion
    if ([self.lblAdivina.text isEqualToString: textoPicado]) {
        [self.matrizFiltrada removeObjectAtIndex:indexPath.row];
        NSLog(@"Adivinaste");
        if (self.matrizFiltrada.count >0) {
            [self generaRandomSeleccion];
        }
    }
    [self.collViewMatrizImagenes reloadData];

}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // No sabemos si se va a implementar el deseleccionado
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize retval = CGSizeMake(20, 20);
    retval.height += 35; retval.width += 35; return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}



@end
