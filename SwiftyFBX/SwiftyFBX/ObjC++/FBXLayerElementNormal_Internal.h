//
//  FBXLayerElementNormal_Internal.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/10.
//

#import <Foundation/Foundation.h>
#import "fbxsdk.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXLayerElementNormal ()
+ (instancetype)createWithCLayerElementNormal:(FbxLayerElementNormal* )cLayerElementNormal;
- (instancetype)initWithCLayerElementNormal:(FbxLayerElementNormal* )cLayerElementNormal;
@end

NS_ASSUME_NONNULL_END
