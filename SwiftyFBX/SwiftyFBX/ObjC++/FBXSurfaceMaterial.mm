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

@end
