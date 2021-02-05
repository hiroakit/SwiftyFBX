//
//  FBXLight.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import "FBXLight.h"
#import "FBXLight_Internal.h"
#import "fbxsdk.h"

@implementation FBXLight
{    
    FbxLight* _cLight;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cLight = NULL;
    }
    
    return self;
}

- (instancetype)initWithCLight:(FbxLight* )cLight
{
    self = [self init];
    if (cLight != NULL) {
        _cLight = cLight;
    }
    
    return self;
}

- (NSString *)getName
{
    if (_cLight == NULL) {
        return @"";
    }

    NSString *name = [NSString stringWithCString:_cLight->GetName() encoding:NSUTF8StringEncoding];
    if (name == nil) {
        return @"";
    }

    return name;
}

- (FBXLightType)getLightType
{
    if (_cLight == NULL) {
        return FBXLightTypeUnknown;
    }
    
    const FbxLight::EType cLightType = _cLight->LightType;
    FBXLightType lightType = FBXLightType(cLightType);
    
    return lightType;
}

- (NSString *)getLightTypeName
{
    FBXLightType type = self.lightType;
    if (type > -1) {
        return FBXLightTypeNames[type];
    }
    
    return @"Unknow";
}
@end
