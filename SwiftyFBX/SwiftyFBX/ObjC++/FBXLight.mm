//
//  FBXLight.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import "FBXLight.h"
#import "FBXLight_Internal.h"
#import "FBXNode.h"
#import "FBXNode_Internal.h"
#import "FBXStruct.h"
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

- (Position)getTranslation
{
    if (_cLight == NULL) {
        return PositionZero;
    }
     
    FbxNode* node = _cLight->GetNode();
    FbxDouble3 translation = node->LclTranslation.Get();
    return PositionMake(translation[0], translation[1], translation[2]);
}

- (FBXNode*)getNode
{
    if (_cLight == NULL) {
        return [[FBXNode alloc] init];
    }
    
    FbxNode* node = _cLight->GetNode();
    if (node == NULL) {
        return [[FBXNode alloc] init];
    }

    return [[FBXNode alloc] initWithCNode:node];
}

@end
