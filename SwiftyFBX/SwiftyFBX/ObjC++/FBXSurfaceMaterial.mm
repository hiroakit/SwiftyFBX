//
//  FBXSurfaceMaterial.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import "FBXSurfaceMaterial.h"
#import "FBXSurfaceMaterial_Internal.h"
#import <fbxsdk.h>

@implementation FBXSurfaceMaterial
{
    FbxSurfaceMaterial* _cMaterial;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cMaterial = NULL;
    }
    return self;
}

- (instancetype)initWithCMaterial:(FbxSurfaceMaterial *)cMaterial
{
    self = [self init];
    if (cMaterial != NULL) {
        _cMaterial = cMaterial;
    }
    return self;
}

- (NSString *)getName
{
    const char* pName = _cMaterial->GetName();
    if (pName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pName
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getShadingModelName
{
    const char* pValue = _cMaterial->sShadingModel;
    if (pValue == NULL) {
        return @"";
    }
    
    FbxPropertyT<FbxString> str = _cMaterial->ShadingModel;
        
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getMultiLayerName
{
    const char* pValue = _cMaterial->sMultiLayer;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getEmissiveName;
{
    const char* pValue = _cMaterial->sEmissive;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getEmissiveFactorName
{
    const char* pValue = _cMaterial->sEmissiveFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getAmbientName
{
    const char* pValue = _cMaterial->sAmbient;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getAmbientFactorName
{
    const char* pValue = _cMaterial->sAmbientFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDiffuse
{
    const char* pValue = _cMaterial->sDiffuse;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDiffuseFactorName
{
    const char* pValue = _cMaterial->sDiffuseFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getSpecularName
{
    const char* pValue = _cMaterial->sSpecular;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getSpecularFactorName
{
    const char* pValue = _cMaterial->sSpecularFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getShininessName
{
    const char* pValue = _cMaterial->sShininess;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getBumpName
{
    const char* pValue = _cMaterial->sBump;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getNormalMapName
{
    const char* pValue = _cMaterial->sNormalMap;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getBumpFactorName
{
    const char* pValue = _cMaterial->sBumpFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getTransparentColorName
{
    const char* pValue = _cMaterial->sTransparentColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getTransparencyFactorName
{
    const char* pValue = _cMaterial->sTransparencyFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getReflectionName
{
    const char* pValue = _cMaterial->sReflection;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getReflectionFactorName
{
    const char* pValue = _cMaterial->sReflectionFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDisplacementColorName
{
    const char* pValue = _cMaterial->sDisplacementColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDisplacementFactorName
{
    const char* pValue = _cMaterial->sDisplacementFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getVectorDisplacementColorName
{
    const char* pValue = _cMaterial->sVectorDisplacementColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getVectorDisplacementFactorName
{
    const char* pValue = _cMaterial->sVectorDisplacementFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (BOOL)isPhong
{
    return _cMaterial->GetClassId().Is(FbxSurfacePhong::ClassId);
}

@end
