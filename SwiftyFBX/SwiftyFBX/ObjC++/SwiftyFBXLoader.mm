//
//  SwiftyFBXLoader.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "SwiftyFBXLoader.h"
#import "SwiftyFBXLoadResult.h"
#import "SwiftyFBXFileFormatVersion.h"
#import "FBXScene.h"
#import "FBXScene_Internal.h"
#import "FBXMesh.h"
#import "FBXMesh_Internal.h"
#import "FBXLayerElementNormal.h"
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyFBXLoader ()
@property (nonatomic) FbxScene* cScene;
@end

NS_ASSUME_NONNULL_END

@implementation SwiftyFBXLoader

- (instancetype)init
{
    return [[SwiftyFBXLoader alloc] initWithURL:[NSURL URLWithString:@""]];
}

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    if (self) {
        _URL = URL;
    }
    return self;
}

- (SwiftyFBXLoadResult *)load
{
    FbxManager* manager = FbxManager::Create();
    FbxIOSettings* settings = FbxIOSettings::Create(manager, IOSROOT);
    manager->SetIOSettings(settings);
    
    int fileFormatVersionMajor,  fileFormatVersionMinor,  fileFormatVersionRevision = 0;
    FbxManager::GetFileFormatVersion(fileFormatVersionMajor, fileFormatVersionMinor, fileFormatVersionRevision);
    
    int major,  minor,  revision = 0;
    FbxImporter* importer = FbxImporter::Create(manager, "");
    BOOL importResult = importer->Initialize(self.URL.path.UTF8String, -1, manager->GetIOSettings());
    importer->GetFileVersion(major, minor, revision);
    
    SwiftyFBXFileFormatVersion *formatVersion = [[SwiftyFBXFileFormatVersion alloc] initWithMajor:major minor:minor revision:revision];
        
    if (!importResult) {
        NSString *message = [NSString stringWithCString:importer->GetStatus().GetErrorString() encoding:NSUTF8StringEncoding];
        NSLog(@"[ERROR] Error Code=%d, %@", importer->GetStatus().GetCode(), message);
        
        importer->Destroy();
        manager->Destroy();
        
        return [[SwiftyFBXLoadResult alloc] initWithResult:importResult formatVersion:formatVersion scene:NULL];
    }
    
    FbxScene* cScene = FbxScene::Create(manager, "originalScene");
    if (importer->Import(cScene)) {
        int count = cScene->GetMemberCount<FbxMesh>();
        NSLog(@"[INFO] Mesh %d", count);
    }
    
    FBXScene *scene = [[FBXScene alloc] initWithCScene:cScene];
    SwiftyFBXLoadResult *result = [[SwiftyFBXLoadResult alloc] initWithResult:importResult formatVersion:formatVersion scene:scene];
//
//    FbxMesh* mesh = scene->GetMember<FbxMesh>(0);
//    FbxNodeAttribute::EType type = mesh->GetAttributeType();
//    if (type == FbxNodeAttribute::eMesh) {
//
//    }
    
    _cScene = cScene;
    
    importer->Destroy();
    manager->Destroy();
    
    return result;
}

+ (SwiftyFBXLoadResult *)loadWithURL:(NSURL *)url
{
    FbxManager* manager = FbxManager::Create();
    FbxIOSettings* settings = FbxIOSettings::Create(manager, IOSROOT);
    manager->SetIOSettings(settings);
    
    int fileFormatVersionMajor,  fileFormatVersionMinor,  fileFormatVersionRevision = 0;
    FbxManager::GetFileFormatVersion(fileFormatVersionMajor, fileFormatVersionMinor, fileFormatVersionRevision);
    
    int major,  minor,  revision = 0;
    FbxImporter* importer = FbxImporter::Create(manager, "");
    BOOL importResult = importer->Initialize(url.path.UTF8String, -1, manager->GetIOSettings());
    importer->GetFileVersion(major, minor, revision);
    
    SwiftyFBXFileFormatVersion *formatVersion = [[SwiftyFBXFileFormatVersion alloc] initWithMajor:major minor:minor revision:revision];
        
    if (!importResult) {
        NSString *message = [NSString stringWithCString:importer->GetStatus().GetErrorString() encoding:NSUTF8StringEncoding];
        NSLog(@"[ERROR] Error Code=%d, %@", importer->GetStatus().GetCode(), message);
        
        importer->Destroy();
        manager->Destroy();
        
        return [[SwiftyFBXLoadResult alloc] initWithResult:importResult formatVersion:formatVersion scene:NULL];
    }
    
    FbxScene* cScene = FbxScene::Create(manager, "originalScene");
    if (importer->Import(cScene)) {
        int count = cScene->GetMemberCount<FbxMesh>();
        NSLog(@"[INFO] Mesh %d", count);
    }
    FbxMesh* cMesh = cScene->GetMember<FbxMesh>(0);
    FbxNodeAttribute::EType type = cMesh->GetAttributeType();
    if (type == FbxNodeAttribute::eMesh) {
        
    }
    
    
    FBXScene *scene = [[FBXScene alloc] initWithCScene:cScene];
    SwiftyFBXLoadResult *result = [[SwiftyFBXLoadResult alloc] initWithResult:importResult
                                                                formatVersion:formatVersion
                                                                        scene:scene];
//    FBXMesh *mesh = scene.meshs.firstObject;
//    int controlPointsCount = [mesh getControlPointsCount];
//    FbxVector4* fbxVector4 = [mesh getControlPoints];
//    int elementNomalCount = [mesh getElementNormalCount];
//    FBXLayerElementNormal *normal = [mesh getElementNormalAtIndex:0];

    importer->Destroy();
    manager->Destroy();
    
    return result;
}
@end
