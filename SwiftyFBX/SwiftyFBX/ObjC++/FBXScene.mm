//
//  FBXScene.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXScene.h"
#import "FBXSecne_Internal.h"
#import "FBXMesh.h"
#import "FBXMesh_Internal.h"
#import "FBXTexture.h"
#import "FBXTexture_Internal.h"
#import "FBXSkeleton.h"
#import "FBXSkeleton_Internal.h"
#import "FBXCamera.h"
#import "FBXCamera_Internal.h"
#import "FBXLight.h"
#import "FBXLight_Internal.h"
#import "FBXSurfaceMaterial.h"
#import "fbxsdk.h"

@implementation FBXScene
{
    FbxScene* _cScene;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cScene = NULL;
        _meshs = [NSMutableArray array];
        _textures = [NSMutableArray array];
        _skeletons = [NSMutableArray array];
        _cameras = [NSMutableArray array];
        _lights = [NSMutableArray array];
        _markers = [NSArray array];
    }
    
    return self;
}

- (instancetype)initWithCScene:(FbxScene* )cScene
{
    self = [self init];
    if(cScene == NULL) {
        return self;
    }
    _cScene = cScene;
    
    int totalCount = 0;
    totalCount = cScene->GetMemberCount<FbxMesh>();
    for (int i = 0; i < totalCount; i++) {
        FbxMesh* cMesh = cScene->GetMember<FbxMesh>(i);
        if (cMesh != NULL) {
            FBXMesh *mesh = [[FBXMesh alloc] initWithCMesh:cMesh];
            [_meshs addObject:mesh];
        }
    }
    
    totalCount = cScene->GetMemberCount<FbxTexture>();
    for (int i = 0; i < totalCount; i++) {
        FbxTexture* cTexture = cScene->GetMember<FbxTexture>(i);
        if (cTexture != NULL) {
            FBXTexture *texture = [[FBXTexture alloc] initWithCTexture:cTexture];
            [_textures addObject:texture];
        }
    }
    
    totalCount = cScene->GetMemberCount<FbxSkeleton>();
    for (int i = 0; i < totalCount; i++) {
        FbxSkeleton* cSkeleton = cScene->GetMember<FbxSkeleton>(i);
        if (cSkeleton != NULL) {
            FBXSkeleton *skeleton = [[FBXSkeleton alloc] initWithCSkeleton:cSkeleton];
            [_skeletons addObject:skeleton];
        }
    }
    
    totalCount = cScene->GetMemberCount<FbxLight>();
    for (int i = 0; i < totalCount; i++) {
        FbxLight* cLight = _cScene->GetMember<FbxLight>(i);
        if (cLight != NULL) {
            FBXLight *light = [[FBXLight alloc] initWithCLight:cLight];            
            [_lights addObject:light];
        }
    }

    totalCount = cScene->GetMemberCount<FbxCamera>();
    for (int i = 0; i < totalCount; i++) {
        FbxCamera* cCamera = _cScene->GetMember<FbxCamera>(i);
        if (cCamera != NULL) {
            FBXCamera *camera = [[FBXCamera alloc] initWithCCamera:cCamera];
            [_cameras addObject:camera];
        }
    }
    
    return self;
}

+ (instancetype)createWithManager:(FBXManager *)manager sceneName:(NSString *)sceneName
{
    return [[FBXScene alloc] init];
}

+ (instancetype)sceneWithCScene:(FbxScene* )cScene
{
    FBXScene *scene = [[FBXScene alloc] init];
    if(cScene == NULL) {
        return scene;
    }
            
    return scene;
}

- (NSUInteger)getPolygonCount
{
    int polygonCount = 0;
    
    for (FBXMesh *mesh in self.meshs) {
        polygonCount += mesh.getPolygonCount;
    }
    
    return polygonCount;
}

- (NSUInteger)getMaterialCount
{
    if(_cScene == NULL) {
        return 0;
    }
    return _cScene->GetMaterialCount();
}

- (FBXSurfaceMaterial*)getMaterialAtIndex:(int)index
{
    if (_cScene == NULL) {
        return nil;
    }
    if (index < 0 || index > [self getMaterialCount]) {
        return nil;
    }
    
    FbxSurfaceMaterial* cMaterial = _cScene->GetMaterial(index);
    if (cMaterial == NULL) {
        return nil;
    }
    
    return [[FBXSurfaceMaterial alloc] init];
}

- (FBXSurfaceMaterial*)getMaterialWithName:(NSString*)name
{
    if (_cScene == NULL) {
        return nil;
    }
    if (name == nil || name.length < 1) {
        return nil;
    }
    
    const char *pName = [name cStringUsingEncoding:NSUTF8StringEncoding];
    FbxSurfaceMaterial* cMaterial = _cScene->GetMaterial(pName);
    if (cMaterial == NULL) {
        return nil;
    }
    
    return [[FBXSurfaceMaterial alloc] init];
}

@end
