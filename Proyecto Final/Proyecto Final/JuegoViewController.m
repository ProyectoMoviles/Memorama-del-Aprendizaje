//
//  JuegoViewController.m
//  Proyecto Final
//
//  Created by Iker Arbulu Lozano on 3/26/15.
//  Copyright (c) 2015 Iker Arbulu Lozano. All rights reserved.
//

#import "JuegoViewController.h"
#import "MenuViewController.h"

@interface JuegoViewController ()

@end

@implementation JuegoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    NSString *filePath = [self dataFilePath];
    
    NSString *plistPath = [ [NSBundle mainBundle] pathForResource: @"Elementos" ofType: @"plist"];
    
    //Revisa si el plist ya existe en la carpeta de datos o si se tiene que guardar
    if ([[NSFileManager defaultManager] fileExistsAtPath: filePath]){
        self.Matriz = [[NSMutableArray alloc] initWithContentsOfFile: filePath];
        NSLog(@"Ya existe");
    }
    else{
        self.Matriz = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
        [self.Matriz writeToFile: filePath atomically: YES];
        NSLog(@"No existe todavia");
    }
    
    self.cantidadElem = 0;
    
    self.matrizFiltrada = [[NSMutableArray alloc]init];
    
    NSString *stringUrl;
    
    //Se cargan las imagenes si esque no se encuentra cargados los datos del plist
    for (int i = 0; i < self.Matriz.count; i++) {
        self.elemMatriz = self.Matriz[i];
        if ([[self.elemMatriz objectForKey:@"ImgData"]length]==0) {
            stringUrl = [self.elemMatriz objectForKey:@"ImgURL"];
            NSURL *nsurl = [NSURL URLWithString: stringUrl];
            NSData *data = [[NSData alloc]initWithContentsOfURL: nsurl];
            [self.elemMatriz setValue:data forKey:@"ImgData"];
            self.Matriz[i] = self.elemMatriz;
        }
        if ([[self.elemMatriz objectForKey:@"IDCategoria"]isEqualToString:self.categoria]) {
            self.matrizFiltrada[self.cantidadElem] = self.elemMatriz;
            
            self.cantidadElem++;
        }
    }
    [self.Matriz writeToFile: filePath atomically: YES];
    
    [self generaRandomSeleccion];
    
    //inicializar timer
    [self startTime];
    
    //agregar notificaciones
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(mandadoAlBackground:) name: UIApplicationDidEnterBackgroundNotification object: app];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(regresoDeBackground:) name: UIApplicationDidBecomeActiveNotification object: app];
    
    /* Debugging */
    NSLog(@"%ld",(long)self.cantidadElem);
    NSLog(@"%ld",(long)self.Matriz.count);
    for (int i = 0; i<self.cantidadElem; i++) {
        NSString *nombre = [self.matrizFiltrada[i] objectForKey:@"Nombre"];
        NSLog(nombre);
    }

}

#pragma mark - Timer
- (void) imprimirTimer{
    int currentTime = [self.lblTiempoJuego.text intValue];
    int newTime = currentTime + 1;
    self.lblTiempoJuego.text = [NSString stringWithFormat:@"%d", newTime];
}

- (void) startTime{
    self.myTicker = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(imprimirTimer) userInfo:nil repeats:YES];
}

- (void) stopTime{
    [self.myTicker invalidate];
}

- (void) resetTime{
    
}

#pragma mark - Notificaciones

- (void) mandadoAlBackground: (NSNotification *) notification{
    [self stopTime];
}

- (void) regresoDeBackground: (NSNotification *) notification{
    [self startTime];
}

#pragma mark - File Path Plist
- (NSString *) dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains ( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex: 0];
    return [documentsDirectory stringByAppendingPathComponent:@"Elementos.plist"];
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

#pragma mark - Oportunidad
- (IBAction)presionoOportunidad:(id)sender {
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
    NSData *data = [self.matrizFiltrada[indexPath.row] objectForKey:@"ImgData"];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"menu"]) {
        
        MenuViewController *controller = [segue destinationViewController];
        
        controller.categoria = self.categoria;
        controller.dificultad = self.dificultad;
        controller.cantidad = self.cantidad;
    }
}

@end
