//
//  FBXMesh.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXLayerContainer.h"
@class FBXLayerElementNormal;

NS_ASSUME_NONNULL_BEGIN

@interface FBXMesh : FBXLayerContainer
- (int)getControlPointsCount;
- (int)getElementNormalCount;
- (FBXLayerElementNormal *)getElementNormalAtIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
