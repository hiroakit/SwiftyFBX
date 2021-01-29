//
//  SwiftyFBXLoader.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "SwiftyFBXLoader.h"
#import "SwiftyFBXLoadResult.h"
#import "SwiftyFBXFormat.h"
#import "FBXScene.h"         
#import "FBXSecne_Internal.h"
#import "FBXMesh.h"
#import "FBXMesh_Internal.h"
#import "FBXLayerElementNormal.h"
#import <fbxsdk.h>

@implementation SwiftyFBXLoader {
    FbxManager* _manager;
    FbxImporter* _importer;
}

- (instancetype)init
{
    return [[SwiftyFBXLoader alloc] initWithURL:[NSURL URLWithString:@""]];
}

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    if (self) {
        _URL = URL;
        _manager = FbxManager::Create();
    }
        
    return self;
}

- (SwiftyFBXLoadResult *)load
{
    if (_manager == NULL) {
        _manager = FbxManager::Create();
    }

    FbxIOSettings* settings = FbxIOSettings::Create(_manager, IOSROOT);
    _manager->SetIOSettings(settings);
    
    int fileFormatVersionMajor,  fileFormatVersionMinor,  fileFormatVersionRevision = 0;
    FbxManager::GetFileFormatVersion(fileFormatVersionMajor, fileFormatVersionMinor, fileFormatVersionRevision);
    
    int major,  minor,  revision = 0;
    
    if (_importer == NULL) {
        _importer = FbxImporter::Create(_manager, "");
    }
    BOOL importResult = _importer->Initialize(self.URL.path.UTF8String, -1, _manager->GetIOSettings());
    _importer->GetFileVersion(major, minor, revision);
    
    SwiftyFBXFormat *format = [[SwiftyFBXFormat alloc] initWithMajor:major
                                                               minor:minor
                                                            revision:revision];
        
    if (!importResult) {
        NSString *message = [NSString stringWithCString:_importer->GetStatus().GetErrorString() encoding:NSUTF8StringEncoding];
        NSLog(@"[ERROR] Error Code=%d, %@", _importer->GetStatus().GetCode(), message);

        return [[SwiftyFBXLoadResult alloc] initWithResult:importResult
                                                    format:format
                                                     scene:NULL];
    }
    
    FbxScene* cScene = FbxScene::Create(_manager, "originalScene");
    _importer->Import(cScene);
//    if (_importer->Import(cScene)) {
//        int count = cScene->GetMemberCount<FbxMesh>();
//        NSLog(@"[INFO] Mesh %d", count);
//    }
    
    FBXScene *scene = [[FBXScene alloc] initWithCScene:cScene];
    SwiftyFBXLoadResult *result = [[SwiftyFBXLoadResult alloc] initWithResult:importResult
                                                                       format:format
                                                                        scene:scene];
//
//    FbxMesh* mesh = scene->GetMember<FbxMesh>(0);
//    FbxNodeAttribute::EType type = mesh->GetAttributeType();
//    if (type == FbxNodeAttribute::eMesh) {
//
//    }

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
    
    SwiftyFBXFormat *format = [[SwiftyFBXFormat alloc] initWithMajor:major
                                                               minor:minor
                                                            revision:revision];
        
    if (!importResult) {
        NSString *message = [NSString stringWithCString:importer->GetStatus().GetErrorString() encoding:NSUTF8StringEncoding];
        NSLog(@"[ERROR] Error Code=%d, %@", importer->GetStatus().GetCode(), message);
        
        importer->Destroy();
        manager->Destroy();
        
        return [[SwiftyFBXLoadResult alloc] initWithResult:importResult
                                                    format:format
                                                     scene:NULL];
    }
    
    FbxScene* cScene = FbxScene::Create(manager, "originalScene");
    importer->Import(cScene);
//    if () {
//        int count = cScene->GetMemberCount<FbxMesh>();
//        NSLog(@"[INFO] Mesh %d", count);
//    }
    
//    FbxMesh* cMesh = cScene->GetMember<FbxMesh>(0);
//    FbxNodeAttribute::EType type = cMesh->GetAttributeType();
//    if (type == FbxNodeAttribute::eMesh) {
//        
//    }
        
    FBXScene *scene = [[FBXScene alloc] initWithCScene:cScene];
    SwiftyFBXLoadResult *result = [[SwiftyFBXLoadResult alloc] initWithResult:importResult
                                                                       format:format
                                                                        scene:scene];
//    FBXMesh *mesh = scene.meshs.firstObject;
//    int controlPointsCount = [mesh getControlPointsCount];
//    FbxVector4* fbxVector4 = [mesh getControlPoints];
//    int elementNomalCount = [mesh getElementNormalCount];
//    FBXLayerElementNormal *normal = [mesh getElementNormalAtIndex:0];

    return result;
}
@end
