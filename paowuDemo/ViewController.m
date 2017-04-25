//
//  ViewController.m
//  paowuDemo
//
//  Created by happi on 2017/4/21.
//  Copyright © 2017年 xishan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *view;
    UIView *view2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [view setBackgroundColor:[UIColor redColor]];
    [view.layer setCornerRadius:10];
    [view setCenter:CGPointMake(20, 100)];
    [self.view addSubview:view];
    
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [view2 setBackgroundColor:[UIColor redColor]];
    [view2.layer setCornerRadius:25];
    [view2 setCenter:CGPointMake(100, 400)];
    [self.view addSubview:view2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    static CGFloat x = 0;
    x += 60;
    if (x>self.view.frame.size.width) {
        x = 20;
    }
    CGPoint point = CGPointMake(x, 100);
    [view parabolaToPoint:point duration:0.2];
    
    
    [view2 setCenter:CGPointMake(100, 400)];
    [view2 parabolaToPoint:CGPointMake(200, 400) duration:2.0 scaleTo:0.1];
}








@end
