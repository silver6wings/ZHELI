#import "SwLocation.h"

@implementation SWLocation
@synthesize locManager,
            latitude,
            longitude,
            horizontalAccuracy,
            verticalAccuracy;

- (id)init{
    if ((self = [super init])) {
        locManager = [[CLLocationManager alloc] init];
        locManager.delegate = self;
        locManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locManager startUpdatingLocation];
    }
    return self;
}

- (void)dealloc {
    [locManager stopUpdatingLocation];
    [locManager release];
    [super dealloc];
}

- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation {
    CLLocationCoordinate2D locat = [newLocation coordinate];
    self.latitude = locat.latitude;
    self.longitude = locat.longitude;
    self.horizontalAccuracy = newLocation.horizontalAccuracy;
    self.verticalAccuracy = newLocation.verticalAccuracy;
    
//    NSLog(@"经度：%f , 纬度：%f",locat.latitude,locat.longitude);
//    NSLog(@"水平准确：%f",newLocation.horizontalAccuracy);
//    NSLog(@"垂直准确：%f",newLocation.verticalAccuracy);
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f",locat.latitude] forKey:@"swLatitude"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f",locat.longitude] forKey:@"swLongitude"];
}
- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *)error{
    
    NSString * errorMessage;
    if ([error code] == kCLErrorDenied){
        errorMessage = @"您的访问被拒绝";
    }
    if ([error code] == kCLErrorLocationUnknown) {
        errorMessage = @"无法定位到您的位置";
    }
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil 
                          message:errorMessage 
                          delegate:self 
                          cancelButtonTitle:@"确定" 
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}


@end
