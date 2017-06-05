//
//  ViewController.m
//  ImageZoomDemo
//
//  Created by tianyaxu on 2017/6/5.
//  Copyright © 2017年 tianyaxu. All rights reserved.
//

#import "ViewController.h"
#import "ZZImageZoomView.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) ZZImageZoomView *imageZoomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (ZZImageZoomView *)imageZoomView {
    if (!_imageZoomView) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _imageZoomView = [[ZZImageZoomView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        [window addSubview:_imageZoomView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenImgView)];
        [_imageZoomView addGestureRecognizer:tap];
    }
    return _imageZoomView;
}

- (void)hiddenImgView {
    [self.imageZoomView removeFromSuperview];
    self.imageZoomView = nil;
}

- (IBAction)tapAction:(id)sender {
    self.imageZoomView.showImg = self.imgView.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
