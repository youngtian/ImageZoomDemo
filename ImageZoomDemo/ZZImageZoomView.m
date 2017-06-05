//
//  ZZImageZoomView.m
//  youjiaxc
//
//  Created by tianyaxu on 2017/6/2.
//  Copyright © 2017年 zzjp. All rights reserved.
//

#import "ZZImageZoomView.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@implementation ZZImageZoomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
        [self createZoomView];
    }
    return self;
}

// 创建放大视图
- (void)createZoomView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 2.0;
    scrollView.minimumZoomScale = 0.7;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (Height - 200) / 2.0, Width, 200)];
    imgView.tag = 500;
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:imgView];
}

// 设置放大图片
- (void)setShowImg:(UIImage *)showImg {
    if (_showImg != showImg) {
        UIImageView *imgView = [self viewWithTag:500];
        imgView.image = showImg;
    }
}

#pragma mark -ScrollView Delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    UIImageView *imgView = [self viewWithTag:500];
    return imgView;
}

// 图片放大后居中显示
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    UIImageView *imgView = [self viewWithTag:500];
    if (scrollView.zoomScale < 1.0) {
        imgView.center = CGPointMake(Width / 2.0, Height / 2.0);
    } else {
        imgView.center = CGPointMake(imgView.frame.size.width / 2.0, Height / 2.0);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
