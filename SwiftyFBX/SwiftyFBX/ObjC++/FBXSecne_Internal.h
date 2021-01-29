//
//  FBXScene_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import <Foundation/Foundation.h>
#import "fbxsdk.h"

NS_ASSUME_NONNULL_BEGIN

@class FBXMesh;
@class FBXTexture;
@class FBXSurfaceMaterial;
@class FBXSkeleton;
@class FBXCamera;
@class FBXLight;
@class FBXPose;

@interface FBXScene ()
@property (nonatomic, readwrite, strong) NSMutableArray<FBXMesh*> *meshs;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXTexture*> *textures;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXSurfaceMaterial*> *materials;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXSkeleton*> *skeletons;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXCamera*> *cameras;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXLight*> *lights;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXPose*> *poses;

- (instancetype)initWithCScene:(FbxScene* )cScene;
@end

NS_ASSUME_NONNULL_END
