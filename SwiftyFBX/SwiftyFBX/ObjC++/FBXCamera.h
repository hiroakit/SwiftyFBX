//
//  FBXCamera.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXCamera : NSObject

typedef NS_ENUM(int, FBXCameraFormat)
{
    FBXCameraFormatUnknown = -1,
    FBXCameraFormatCustomFormat = 0,
    FBXCameraFormatD1NTSC,
    FBXCameraFormatNTSC,
    FBXCameraFormatPAL,
    FBXCameraFormatD1PAL,
    FBXCameraFormatHD,
    FBXCameraFormat640x480,
    FBXCameraFormat320x200,
    FBXCameraFormat320x240,
    FBXCameraFormat128x128,
    FBXCameraFormatFullscreen
};

@property (nonatomic, readonly, getter=getName) NSString *name;
@property (nonatomic, readonly, getter=getFormat) FBXCameraFormat format;
@property (nonatomic, readonly, getter=getPosition) Position position;
- (NSString *)getName;
- (FBXCameraFormat)getFormat;
- (Position)getPosition;
@end

NS_ASSUME_NONNULL_END
