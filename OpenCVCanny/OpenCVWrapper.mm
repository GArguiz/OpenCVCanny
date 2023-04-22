//
//  OpenCVWrapper.m
//  OpenCVCanny
//
//  Created by Gilberto Arguiz on 21/4/23.
//

#import <opencv2/opencv.hpp>

#import <opencv2/imgcodecs/ios.h>

#import <opencv2/videoio/cap_ios.h>


#import "OpenCVWrapper.h"

using namespace cv;

@interface OpenCVWrapper () <CvVideoCameraDelegate>
@end


Mat src, src_gray;
Mat dst, detected_edges;

@implementation OpenCVWrapper
{
    CvVideoCamera * videoCamera;
    Boolean shouldProccess;
    int edgeGradient;
    int blur;
    int angle;
}

-(id)initWithImageView:(UIImageView*)iv
{
    edgeGradient = 3;
    blur = 3;
    angle = 120;
    shouldProccess = false;
    videoCamera = [[CvVideoCamera alloc] initWithParentView:iv];
    
    videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset640x480;
    videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    videoCamera.defaultFPS = 30;
    videoCamera.grayscaleMode = NO;
    
    videoCamera.delegate = self;
    
   

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        [videoCamera start];

     
    });
    
    
    return self;
}

- (void)setEdgeGradient:(int)value
{
    edgeGradient = value;
}

- (void)setBlur:(int)value
{
    blur = value;
}

- (void)setAngle:(int)value
{
    angle = value;
}



#ifdef __cplusplus
- (void)processImage:(Mat&)image
{
    // Do some OpenCV stuff with the image
    if(shouldProccess){
        cvtColor(image, image, COLOR_RGB2GRAY, 0);
        
        cv::blur(image, image, cv::Size(blur, blur));
        // You can try more different parameters
        Canny(image, image, angle, 60 + angle, edgeGradient, false);
    }
}
#endif


-(void)startCamera
{
    shouldProccess = true;
}

-(void)stopCamera
{
    shouldProccess = false;
    
}
@end
