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
#import "FBXPose.h"
#import "FBXPose_Internal.h"
#import "FBXSurfaceMaterial.h"
#import "FBXSurfaceMaterial_Internal.h"
#import "FBXAnimStack.h"
#import "FBXAnimStack_Internal.h"
#import <fbxsdk.h>

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
        _materials = [NSMutableArray array];
        _skeletons = [NSMutableArray array];
        _cameras = [NSMutableArray array];
        _lights = [NSMutableArray array];
        _poses = [NSMutableArray array];
        _animationStacks = [NSMutableArray array];
        _markers = [NSArray array];
        _nurbs = [NSArray array];
        _patches = [NSArray array];
        _lodgroups = [NSArray array];
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

    totalCount = cScene->GetPoseCount();
    for (int i = 0; i < totalCount; i++) {
        FbxPose* cPose = _cScene->GetPose(i);
        if (cPose != NULL) {
            FBXPose *pose = [[FBXPose alloc] initWithCPose:cPose];
            [_poses addObject:pose];
        }
    }

//    totalCount = cScene->GetCharacterPoseCount();
//    for (int i = 0; i < totalCount; i++) {
//        FbxCharacterPose* cPose = _cScene->GetCharacterPose(i);
//        if (cPose != NULL) {
//            // FBXPose *pose = [[FBXPose alloc] initWithCPose:cPose];
//            //[_poses addObject:@"hoge"];
//        }
//    }

    
    totalCount = _cScene->GetMaterialCount();
    for (int i = 0; i < totalCount; i++) {
        FbxSurfaceMaterial* cMaterial = _cScene->GetMaterial(i);
        if (cMaterial != NULL) {
            FBXSurfaceMaterial *material = [[FBXSurfaceMaterial alloc] initWithCMaterial:cMaterial];
            [_materials addObject:material];
        }
    }

    totalCount = _cScene->GetSrcObjectCount<FbxAnimStack>();
    for (int i = 0; i < totalCount; i++) {
        FbxAnimStack* cAnimStack = _cScene->GetSrcObject<FbxAnimStack>(i);
        if (cAnimStack != NULL) {
            FBXAnimStack *animStack = [[FBXAnimStack alloc] initWithCAnimStack:cAnimStack];
            [_animationStacks addObject:animStack];
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

- (FBXAnimStack *)getCurrentAnimationStack
{
    if (_cScene == NULL) {
        return nil;
    }
    
    FbxAnimStack* stack = _cScene->GetCurrentAnimationStack();
    if (stack == NULL) {
        return nil;
    }

    return [[FBXAnimStack alloc] initWithCAnimStack:stack];
}

- (FBXAnimStack *)getAnimationStackAtIndex:(int)index
{
    if (_cScene == NULL) {
        return nil;
    }
    
    int count = _cScene->GetSrcObjectCount<FbxAnimStack>();
    if (index < 0 || index >= count) {
        return nil;
    }
    
    FbxAnimStack* stack = _cScene->GetSrcObject<FbxAnimStack>(index);
    if (stack == NULL) {
        return nil;
    }
    
    return [[FBXAnimStack alloc] initWithCAnimStack:stack];
}

- (FBXUpVector)getCurrentAxis
{
    int dir;
    FbxAxisSystem axis = _cScene->GetGlobalSettings().GetAxisSystem();
    FbxAxisSystem::EUpVector vector = axis.GetUpVector(dir);
    return (FBXUpVector)vector;
}

@end

