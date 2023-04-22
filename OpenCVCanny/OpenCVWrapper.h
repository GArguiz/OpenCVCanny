//
//  OpenCVWrapper.h
//  OpenCVCanny
//
//  Created by Gilberto Arguiz on 21/4/23.
//

#ifndef OpenCVWrapper_h
#define OpenCVWrapper_h

// Need this ifdef, so the C++ header won't confuse Swift
#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#endif

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface OpenCVWrapper : NSObject

-(id)initWithImageView:(UIImageView*)iv;

-(void)setEdgeGradient:(int)value;

-(void)setBlur:(int)value;

-(void)setAngle:(int)value;

-(void)startCamera;

-(void)stopCamera;

@end

#endif
