# 通过ScrollView实现图片的缩放

通过设置ScrollView的缩大缩小数值：

maximumZoomScale // ScrollView最大缩大值

minimumZoomScale // ScrollView最小缩小值

// 实现该代理方法，展示所要缩放的视图   
* - (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
}

![imageZoom](https://github.com/youngtian/ImageZoomDemo/blob/master/ImageZoomDemo/imgZoom.gif)