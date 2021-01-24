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
    if (_cCamera != NULL) {
        _cCamera = cCamera;
    }
    
    return self;
}

- (NSString *)name
{
    if (_cCamera == NULL) {
        return @"";
    }

    NSString *name = [NSString stringWithCString:_cCamera->GetName() encoding:NSUTF8StringEncoding];
    if (name == nil) {
        return @"";
    }

    return name;
}

@end
