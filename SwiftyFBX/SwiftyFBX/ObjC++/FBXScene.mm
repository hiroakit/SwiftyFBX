//
//  FBXScene.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXScene.h"
#import "FBXScene_Internal.h"
#import "FBXMesh.h"
#import "FBXMesh_Internal.h"
#import "fbxsdk.h"

@implementation FBXScene

- (instancetype)init
{
    self = [super init];
    if (self) {
        _markers = [NSArray array];
        _meshs = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithCScene:(FbxScene* )cScene
{
    self = [self init];
    if(cScene == NULL) {
        return self;
    }
    
    int totalCount = cScene->GetMemberCount<FbxMesh>();
    for (int i = 0; i < totalCount; i++) {
        FbxMesh* cMesh = cScene->GetMember<FbxMesh>(i);
        if (cMesh != NULL) {
            FBXMesh *mesh = [[FBXMesh alloc] initWithCMesh:cMesh];
            [_meshs addObject:mesh];
        }
    }
    
    return self;
}

- (instancetype)createWithManager:(FBXManager* )manager sceneName:(NSString *)sceneName {
    return [[FBXScene alloc] init];
}

+ (instancetype)sceneWithCScene:(FbxScene* )cScene {
    FBXScene *scene = [[FBXScene alloc] init];
    if(cScene == NULL) {
        return scene;
    }
            
    return scene;
}

- (int)GetMemberCount {
    return 0;
}

@end
