//
//  ViewController.m
//  DingdingPunchCard
//
//  Created by Abeautifulliar on 2018/4/29.
//  Copyright © 2018年 ElegantLiar. All rights reserved.
//

#import "ViewController.h"
#import "CoreLocationTransform.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 116.397477,39.908692 天安门
    
    CLLocationCoordinate2D coor2d = [CoreLocationTransform gcj02ToWgs84:CLLocationCoordinate2DMake(39.908692, 116.397477)];
    NSLog(@"%f", coor2d.latitude);
    NSLog(@"%f", coor2d.longitude);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
