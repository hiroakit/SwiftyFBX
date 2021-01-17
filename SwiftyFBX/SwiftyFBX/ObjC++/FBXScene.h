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

@interface FBXScene : FBXDocument
@property (nonatomic, readonly) NSArray *markers;
@property (nonatomic, readonly) NSArray *skeletons;
@property (nonatomic, readonly, strong) NSArray *meshs;
@property (nonatomic, readonly) NSArray *nurbs;
@property (nonatomic, readonly) NSArray *patches;
@property (nonatomic, readonly) NSArray *cameras;
@property (nonatomic, readonly) NSArray *lights;
@property (nonatomic, readonly) NSArray *lodgroups;

//+ (instancetype)createWithManager:(FBXManager *)manager sceneName:(NSString *)sceneName;
- (int)textureCount;
@end

NS_ASSUME_NONNULL_END
