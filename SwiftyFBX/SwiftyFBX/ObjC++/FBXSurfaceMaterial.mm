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
    if (_cMaterial == NULL) {
        return @"";
    }
    
    const char* pName = _cMaterial->GetName();
    if (pName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pName
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getShadingModelName
{
    if (_cMaterial == NULL) {
        return @"";
    }

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
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sMultiLayer;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getEmissiveName;
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sEmissive;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getEmissiveFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sEmissiveFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getAmbientName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sAmbient;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getAmbientFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sAmbientFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDiffuse
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDiffuse;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDiffuseFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDiffuseFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getSpecularName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sSpecular;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getSpecularFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sSpecularFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getShininessName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sShininess;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getBumpName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sBump;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getNormalMapName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sNormalMap;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getBumpFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sBumpFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getTransparentColorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sTransparentColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getTransparencyFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sTransparencyFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getReflectionName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sReflection;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getReflectionFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sReflectionFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDisplacementColorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDisplacementColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDisplacementFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDisplacementFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getVectorDisplacementColorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sVectorDisplacementColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getVectorDisplacementFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sVectorDisplacementFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (BOOL)isPhong
{
    if (_cMaterial == NULL) {
        return NO;
    }

    return _cMaterial->GetClassId().Is(FbxSurfacePhong::ClassId);
}

@end
