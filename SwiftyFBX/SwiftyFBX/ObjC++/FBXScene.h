//
//  FBXScene.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXDocument.h"
#import "FBXManager.h"

NS_ASSUME_NONNULL_BEGIN

@class FBXMesh;
@class FBXTexture;
@class FBXSkeleton;
@class FBXCamera;
@class FBXLight;
@class FBXPose;
@class FBXSurfaceMaterial;
@class FBXAnimStack;

@interface FBXScene : FBXDocument
@property (nonatomic, readonly) NSArray<FBXMesh*> *meshs;
@property (nonatomic, readonly) NSArray<FBXTexture*> *textures;
@property (nonatomic, readonly) NSArray<FBXSurfaceMaterial*> *materials;
@property (nonatomic, readonly) NSArray<FBXSkeleton*> *skeletons;
@property (nonatomic, readonly) NSArray<FBXCamera*> *cameras;
@property (nonatomic, readonly) NSArray<FBXLight*> *lights;
@property (nonatomic, readonly) NSArray<FBXPose*> *poses;
@property (nonatomic, readonly) NSArray<FBXAnimStack*> *animationStacks;
@property (nonatomic, readonly) NSArray *markers;
@property (nonatomic, readonly) NSArray *nurbs;
@property (nonatomic, readonly) NSArray *patches;
@property (nonatomic, readonly) NSArray *lodgroups;
@property (nonatomic, readonly, getter=getAnimationStackCount) NSUInteger animationStackCount;

- (NSUInteger)getPolygonCount;
- (NSUInteger)getMaterialCount;
- (FBXSurfaceMaterial*)getMaterialAtIndex:(int)index;
- (FBXSurfaceMaterial*)getMaterialWithName:(NSString*)name;
- (nullable FBXAnimStack *)getCurrentAnimationStack;
- (nullable FBXAnimStack *)getAnimationStackAtIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
