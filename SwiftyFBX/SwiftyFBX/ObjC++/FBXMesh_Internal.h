//
//  FBXMesh_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import <Foundation/Foundation.h>
#import "fbxsdk.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXMesh ()
- (instancetype)initWithCMesh:(FbxMesh* )cMesh;
@end

NS_ASSUME_NONNULL_END
