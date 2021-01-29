//
//  FBXMesh.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXGeometry.h"
@class FBXLayerElementNormal;

NS_ASSUME_NONNULL_BEGIN

@interface FBXMesh : FBXGeometry
- (int)getControlPointsCount;
- (int)getElementNormalCount;
- (int)getPolygonCount;
- (FBXLayerElementNormal *)getElementNormalAtIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
