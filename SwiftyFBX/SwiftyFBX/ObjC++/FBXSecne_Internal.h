//
//  FBXScene_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import <Foundation/Foundation.h>
#import "fbxsdk.h"

NS_ASSUME_NONNULL_BEGIN

@class FBXTexture;

@interface FBXScene ()
@property (nonatomic, readwrite, strong) NSMutableArray *meshs;
@property (nonatomic, readwrite, strong) NSMutableArray<FBXTexture*> *textures;

- (instancetype)initWithCScene:(FbxScene* )cScene;
@end

NS_ASSUME_NONNULL_END
