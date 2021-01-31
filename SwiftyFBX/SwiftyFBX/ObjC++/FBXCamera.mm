//
//  FBXCamera.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import "FBXCamera.h"
#import <fbxsdk.h>

@implementation FBXCamera
{
    FbxCamera* _cCamera;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cCamera = NULL;
    }
    
    return self;
}

- (instancetype)initWithCCamera:(FbxCamera* )cCamera
{
    self = [self init];
    if (cCamera != NULL) {
        _cCamera = cCamera;
    }
    
    return self;
}

- (NSString *)getName
{
    if (_cCamera == NULL) {
        return @"";
    }
    
    const char* pName = _cCamera->GetName();
    if (pName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pName
                              encoding:NSUTF8StringEncoding];
}

- (FBXCameraFormat)getFormat
{
    if (_cCamera == NULL) {
        return FBXCameraFormatUnknown;
    }
    const FbxCamera::EFormat cFormat = _cCamera->GetFormat();
    FBXCameraFormat format = FBXCameraFormat(cFormat);
    
    return format;
}

- (Position)getPosition
{
    Position position = { 0.0f, 0.0f, 0.0f };
    if (_cCamera == NULL) {
        return position;
    }
    
    FbxVector4 camera = _cCamera->Position.Get();
    if (camera.Length() >= 3) {
        position.x = camera[0];
        position.y = camera[1];
        position.z = camera[2];
    }
    
    return position;
}

@end
